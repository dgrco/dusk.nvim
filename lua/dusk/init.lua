-- lua/dusk/init.lua
-- dusk.nvim — a minimal, restrained dark theme.
-- GitHub dark default background · Kanagawa text · Red keywords · Yellow functions

local M = {}

M.config = {
  -- Which variant to use.
  -- Built-in variants: "dusk" (default), "dusk-soft"
  -- Each variant has its own colorscheme entry, but you can also set this
  -- explicitly if you want to use setup() + a single colorscheme name.
  variant = "dusk",

  -- Override specific palette colors. Keys match the base palette.
  -- Applied on top of the resolved variant, so you can tweak any variant.
  -- Example: color_overrides = { red = "#f47067" }
  color_overrides = {},

  -- Override specific highlight groups after theme is applied.
  -- Receives the resolved color table (with aliases) as argument.
  -- Example:
  --   highlight_overrides = function(c)
  --     return { Normal = { bg = c.none } }
  --   end
  highlight_overrides = nil,

  -- Make backgrounds transparent (Normal, NormalFloat, NvimTree, etc.)
  transparent = false,

  -- Dim inactive windows
  dim_inactive = false,

  -- Terminal colors (sets vim.g.terminal_color_*)
  terminal_colors = true,

  -- Style options
  styles = {
    -- Set to true to enable italic on comments
    comments_italic = false,

    -- Set to true to enable bold on keywords
    keywords_bold = false,

    -- Set to true to enable italic on function params
    params_italic = false,
  },
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

-- Called by colors/dusk.lua and colors/dusk-soft.lua.
-- `variant` overrides M.config.variant when called from a colorscheme entry file.
function M.load(variant)
  if vim.version().minor < 8 then
    vim.notify("dusk.nvim requires Neovim >= 0.8", vim.log.levels.ERROR)
    return
  end

  -- Variant priority: explicit arg (from colors/ file) > config > default
  local chosen = variant or M.config.variant or "dusk"

  local palette = require("dusk.palette")
  local c = palette.get(chosen)

  -- Apply user color overrides on top of the resolved variant
  if M.config.color_overrides and next(M.config.color_overrides) then
    c = vim.tbl_extend("force", c, M.config.color_overrides)
    -- Re-apply aliases so semantic keys (c.keyword, etc.) reflect any overridden raws
    local variants = require("dusk.variants")
    c = variants.with_aliases(c)
  end

  -- Apply transparency
  if M.config.transparent then
    c.bg       = "NONE"
    c.bg1      = "NONE"
    c.bg_popup = "NONE"
    c.bg3      = "NONE"
  end

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = chosen

  -- Load highlight group modules
  local groups = {}
  local modules = { "editor", "treesitter", "lsp", "plugins" }

  for _, mod in ipairs(modules) do
    local ok, result = pcall(require, "dusk.groups." .. mod)
    if ok then
      local hl = result.get(c)
      groups = vim.tbl_extend("force", groups, hl)
    else
      vim.notify(
        "dusk.nvim: failed to load module '" .. mod .. "': " .. result,
        vim.log.levels.WARN
      )
    end
  end

  -- Apply style overrides
  if M.config.styles.comments_italic then
    for key, val in pairs(groups) do
      if key:match("^Comment") or key:match("^@comment") then
        groups[key] = vim.tbl_extend("force", val, { italic = true })
      end
    end
  end

  if M.config.styles.keywords_bold then
    for key, val in pairs(groups) do
      if key:match("^@keyword") or key == "Keyword" or key == "Statement"
          or key == "Conditional" or key == "Repeat" then
        groups[key] = vim.tbl_extend("force", val, { bold = true })
      end
    end
  end

  if M.config.styles.params_italic then
    for key, val in pairs(groups) do
      if key == "@variable.parameter" or key == "@lsp.type.parameter" then
        groups[key] = vim.tbl_extend("force", val, { italic = true })
      end
    end
  end

  -- Dim inactive windows
  if M.config.dim_inactive then
    groups["NormalNC"] = { fg = c.fg_subtle, bg = c.bg }
  end

  -- Apply user highlight overrides
  if M.config.highlight_overrides then
    local ok, overrides = pcall(M.config.highlight_overrides, c)
    if ok and type(overrides) == "table" then
      groups = vim.tbl_extend("force", groups, overrides)
    end
  end

  -- Set all highlight groups
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  -- Terminal colors
  if M.config.terminal_colors then
    M._set_terminal_colors(c)
  end
end

function M._set_terminal_colors(c)
  vim.g.terminal_color_0  = c.bg3
  vim.g.terminal_color_1  = c.red
  vim.g.terminal_color_2  = "#3fb950"
  vim.g.terminal_color_3  = c.yellow
  vim.g.terminal_color_4  = c.blue
  vim.g.terminal_color_5  = "#b392f0"
  vim.g.terminal_color_6  = c.builtin
  vim.g.terminal_color_7  = c.fg_muted
  vim.g.terminal_color_8  = c.fg_subtle
  vim.g.terminal_color_9  = "#ffa198"
  vim.g.terminal_color_10 = "#56d364"
  vim.g.terminal_color_11 = c.orange
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = "#d2a8ff"
  vim.g.terminal_color_14 = c.teal
  vim.g.terminal_color_15 = c.fg
end

return M

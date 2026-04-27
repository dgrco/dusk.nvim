-- extras/lualine.lua
-- Lualine theme for dusk.nvim
--
-- Usage in your lualine config:
--   require("lualine").setup({
--     options = {
--       theme = require("dusk.extras.lualine"),
--     },
--   })

local palette = require("dusk.palette")

local function build(variant)
  local c = palette.get(variant)

  return {
    normal = {
      a = { fg = c.bg,        bg = c.yellow, gui = "bold" },
      b = { fg = c.fg_muted,  bg = c.bg3 },
      c = { fg = c.fg_subtle, bg = c.bg3 },
    },

    insert = {
      a = { fg = c.bg,        bg = c.blue, gui = "bold" },
      b = { fg = c.fg_muted,  bg = c.bg3 },
      c = { fg = c.fg_subtle, bg = c.bg3 },
    },

    visual = {
      a = { fg = c.bg,        bg = c.orange, gui = "bold" },
      b = { fg = c.fg_muted,  bg = c.bg3 },
      c = { fg = c.fg_subtle, bg = c.bg3 },
    },

    replace = {
      a = { fg = c.bg,        bg = c.red, gui = "bold" },
      b = { fg = c.fg_muted,  bg = c.bg3 },
      c = { fg = c.fg_subtle, bg = c.bg3 },
    },

    command = {
      a = { fg = c.bg,        bg = c.red, gui = "bold" },
      b = { fg = c.fg_muted,  bg = c.bg3 },
      c = { fg = c.fg_subtle, bg = c.bg3 },
    },

    terminal = {
      a = { fg = c.bg,        bg = c.builtin, gui = "bold" },
      b = { fg = c.fg_muted,  bg = c.bg3 },
      c = { fg = c.fg_subtle, bg = c.bg3 },
    },

    inactive = {
      a = { fg = c.fg_subtle, bg = c.bg3 },
      b = { fg = c.fg_subtle, bg = c.bg3 },
      c = { fg = c.fg_subtle, bg = c.bg3 },
    },
  }
end

return build

-- lua/dusk/variants/init.lua
-- All variants defined in one place.
-- Each variant overrides only the keys that differ from the base palette.
-- The generator (extras/terminal.lua) and palette.lua both consume this.

local M = {}

-- ─── Base palette ─────────────────────────────────────────────────────────────
-- This is the canonical "dusk" variant. All other variants override on top.
M.base = {
  -- Backgrounds
  bg         = "#0d1117",
  bg1        = "#161b22",
  bg2        = "#1c2128",
  bg3        = "#21262d",
  bg_popup   = "#1c2128",

  -- Selection
  sel_bg     = "#2a3241",
  sel_fg     = "#dcd7ba",

  -- Borders
  border     = "#30363d",
  border_hi  = "#484f58",

  -- Text
  fg         = "#dcd7ba",
  fg_muted   = "#8b949e",
  fg_subtle  = "#4d5566",
  fg_dark    = "#6e7681",

  -- Syntax
  red        = "#ff7b72",
  yellow     = "#e6c384",
  green      = "#8dba8d",
  green_dim  = "#6fa68d",
  orange     = "#ed9d82",
  peach      = "#edb082",
  teal       = "#7dcfff",
  blue       = "#79c0ff",

  -- Git
  git_add    = "#3fb950",
  git_del    = "#f85149",
  git_change = "#d29922",

  -- Diagnostics
  error      = "#f85149",
  warn       = "#d29922",
  info       = "#79c0ff",
  hint       = "#8b949e",

  -- Special
  none       = "NONE",
}

-- ─── Variant overrides ────────────────────────────────────────────────────────
-- Each entry: keys that differ from M.base. Everything else is inherited.

M.variants = {
  -- Original dusk — no overrides needed (uses base as-is)
  dusk = {},

  -- dusk-soft: slightly lighter bg, softened red
  -- Warmer and a touch more breathable than the default.
  -- bg lifted ~1 stop: #0d1117 → #111418
  -- red desaturated/dimmed: #ff7b72 → #e0736b (same hue, ~15% less sat, ~8% less bright)
  ["dusk-soft"] = {
    bg         = "#111418",   -- lifted: a shade less cave-dark
    bg1        = "#191e24",   -- follows bg up by similar delta
    bg2        = "#1f242b",   -- selection surface, slightly lighter
    bg3        = "#242930",   -- statusline / inactive
    bg_popup   = "#1f242b",

    red        = "#e0736b",   -- softer red: same hue, pulled back in sat + brightness
  },

  -- dusk-dawn: dark blue-grey bg, noticeably lighter than dusk/dusk-soft.
  -- Inspired by the mid-tone dark themes (think Tokyo Night, Melange dark).
  -- bg sits around #16202e — still dark, but with clear blue-grey depth.
  -- Softer red to match the more breathable atmosphere.
  ["dusk-dawn"] = {
    bg         = "#1e2228",   -- just a touch darker than dimmed, not as deep as default
    bg1        = "#252b32",   -- cursor line / active context
    bg2        = "#2b3139",   -- selection / float surfaces
    bg3        = "#30373f",   -- statusline / tabline / inactive
    bg_popup   = "#252b32",

    sel_bg     = "#35424f",   -- selection: comfortable contrast on this bg

    border     = "#363e47",   -- border: slightly lifted from bg3
    border_hi  = "#4e5864",

    fg_subtle  = "#526070",   -- slightly lifted subtle text to stay readable on lighter bg

    red        = "#e57068",   -- softer red: same family, slightly less aggressive on the lighter bg
  },
}

-- ─── Resolve a variant to its full color table ────────────────────────────────
-- Returns a flat table of all colors for the given variant name.
-- Unknown variant names silently fall back to "dusk".
function M.resolve(name)
  local overrides = M.variants[name] or M.variants["dusk"]
  return vim.tbl_extend("force", M.base, overrides)
end

-- ─── Semantic aliases ─────────────────────────────────────────────────────────
-- Applied after resolution so aliases always point at the final values.
function M.with_aliases(c)
  c.keyword  = c.red
  c.func     = c.yellow
  c.type_hl  = c.peach
  c.string   = c.green
  c.str_esc  = c.green_dim
  c.comment  = c.fg_subtle
  c.constant = c.red
  c.builtin  = c.teal
  c.text     = c.fg
  c.op       = c.fg_muted
  return c
end

-- ─── List all variant names ───────────────────────────────────────────────────
function M.list()
  local names = {}
  for k in pairs(M.variants) do
    table.insert(names, k)
  end
  table.sort(names)
  return names
end

return M

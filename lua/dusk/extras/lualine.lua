-- extras/lualine.lua
-- Lualine theme for dusk.nvim
--
-- Usage in your lualine config:
--   require("lualine").setup({
--     options = {
--       theme = require("dusk.extras.lualine"),
--     },
--   })

local c = require("dusk.palette").colors

local dusk = {}

dusk.normal = {
  a = { fg = c.bg,        bg = c.yellow, gui = "bold" },  -- yellow pill
  b = { fg = c.fg_muted,  bg = c.bg3 },
  c = { fg = c.fg_subtle, bg = c.bg3 },
}

dusk.insert = {
  a = { fg = c.bg,        bg = c.blue,   gui = "bold" },
  b = { fg = c.fg_muted,  bg = c.bg3 },
  c = { fg = c.fg_subtle, bg = c.bg3 },
}

dusk.visual = {
  a = { fg = c.bg,        bg = c.orange, gui = "bold" },  -- orange pill
  b = { fg = c.fg_muted,  bg = c.bg3 },
  c = { fg = c.fg_subtle, bg = c.bg3 },
}

dusk.replace = {
  a = { fg = c.bg,        bg = c.red,    gui = "bold" },
  b = { fg = c.fg_muted,  bg = c.bg3 },
  c = { fg = c.fg_subtle, bg = c.bg3 },
}

dusk.command = {
  a = { fg = c.bg,        bg = c.red,    gui = "bold" },
  b = { fg = c.fg_muted,  bg = c.bg3 },
  c = { fg = c.fg_subtle, bg = c.bg3 },
}

dusk.terminal = {
  a = { fg = c.bg,        bg = c.builtin, gui = "bold" },
  b = { fg = c.fg_muted,  bg = c.bg3 },
  c = { fg = c.fg_subtle, bg = c.bg3 },
}

dusk.inactive = {
  a = { fg = c.fg_subtle, bg = c.bg3 },
  b = { fg = c.fg_subtle, bg = c.bg3 },
  c = { fg = c.fg_subtle, bg = c.bg3 },
}

return dusk

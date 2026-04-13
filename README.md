# dusk.nvim

A restrained dark theme for Neovim. Warm text, purposeful color.

---

## Requirements

- Neovim >= 0.8
- `termguicolors` enabled (the theme sets this automatically)

---

## Installation

**lazy.nvim**
```lua
{
  "yourname/dusk.nvim",
  priority = 1000,
  config = function()
    require("dusk").setup({
      -- optional overrides here
    })
    vim.cmd("colorscheme dusk")
  end,
}
```

**packer.nvim**
```lua
use {
  "yourname/dusk.nvim",
  config = function()
    require("dusk").setup({})
    vim.cmd("colorscheme dusk")
  end
}
```

---

## Configuration

All options with their defaults:

```lua
require("dusk").setup({
  -- Override palette colors
  -- Keys are from lua/dusk/palette.lua M.colors table
  color_overrides = {},
  -- Example: color_overrides = { red = "#f47067", bg = "#080c12" }

  -- Override highlight groups after theme is applied
  -- Receives the resolved color table as argument
  highlight_overrides = nil,
  -- Example:
  -- highlight_overrides = function(c)
  --   return {
  --     Normal = { bg = c.none },
  --     ["@keyword"] = { fg = c.red, bold = true },
  --   }
  -- end,

  -- Transparent background (Normal, NormalFloat, sidebars, etc.)
  transparent = false,

  -- Dim inactive windows
  dim_inactive = false,

  -- Terminal colors (vim.g.terminal_color_*)
  terminal_colors = true,

  styles = {
    -- Italic comments
    comments_italic = false,

    -- Bold keywords
    keywords_bold = false,

    -- Italic function parameters
    params_italic = false,
  },
})
```

---

## Lualine integration

```lua
require("lualine").setup({
  options = {
    theme = require("dusk.extras.lualine"),
  },
})
```

Mode colors:
- **Normal**: yellow
- **Insert**: blue
- **Visual**: orange
- **Replace / Command**: red

---

## Customization examples

### Slightly darker background
```lua
require("dusk").setup({
  color_overrides = {
    bg = "#080c12",
  },
})
```

### Transparent float windows
```lua
require("dusk").setup({
  highlight_overrides = function(c)
    return {
      NormalFloat = { fg = c.fg, bg = c.none },
      FloatBorder = { fg = c.border, bg = c.none },
    }
  end,
})
```

### Bold keywords
```lua
require("dusk").setup({
  styles = { keywords_bold = true },
})
```

### Italic comments
```lua
require("dusk").setup({
  styles = { comments_italic = true },
})
```

---

## Plugin support

| Plugin | Status |
|---|---|
| Treesitter | ✓ Full `@` capture groups |
| LSP diagnostics | ✓ |
| LSP semantic tokens | ✓ `@lsp.type.*` + `@lsp.typemod.*` |
| Telescope | ✓ |
| nvim-tree | ✓ |
| Neo-tree | ✓ |
| Lualine | ✓ (see extras/) |
| Gitsigns | ✓ |
| nvim-cmp | ✓ including kind icons |
| Indent Blankline (v2 & v3) | ✓ |
| Which-key | ✓ |
| Mason | ✓ |
| Lazy.nvim | ✓ |
| Flash.nvim | ✓ |
| Trouble.nvim | ✓ |
| nvim-notify | ✓ |
| Noice | ✓ |
| Mini.nvim | ✓ statusline + cursorword + pick |
| blink.cmp | ✓ full coverage |
| fzf-lua | ✓ full coverage |
| Snacks.nvim | ✓ picker + dashboard + notifier |
| Aerial.nvim | ✓ |
| Navic | ✓ |
| render-markdown.nvim | ✓ |
| vim-illuminate | ✓ |

---

## Palette reference

```
bg          #0d1117   main background
bg1         #161b22   sidebar / float bg
bg2         #1c2128   selection / visual
bg3         #21262d   inactive / statusline
border      #30363d   splits, borders
border_hi   #484f58   focused borders

fg          #dcd7ba   main text
fg_muted    #8b949e   secondary text
fg_subtle   #4d5566   comments
fg_dark     #6e7681   inactive / disabled

red         #ff7b72   keywords
yellow      #e6c384   functions / methods
blue       #79c0ff   UI accents, info diagnostics, links
orange      #ffa657   constants, numbers
teal        #7dcfff   built-ins (used sparingly)
```

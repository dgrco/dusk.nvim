-- dusk: editor highlight groups
-- Base vim highlight groups + UI

local M = {}

function M.get(c)
  return {
    -- ─── Editor chrome ────────────────────────────────────────────────────────
    Normal          = { fg = c.fg,        bg = c.bg },
    NormalFloat     = { fg = c.fg,        bg = c.bg_popup },
    NormalNC        = { fg = c.fg_muted,  bg = c.bg3 },
    FloatBorder     = { fg = c.border_hi, bg = c.bg_popup },
    FloatTitle      = { fg = c.yellow,    bg = c.bg_popup },

    -- Cursor
    Cursor          = { fg = c.bg,        bg = c.fg },
    CursorIM        = { fg = c.bg,        bg = c.fg },
    CursorLine      = { bg = c.bg1 },
    CursorLineNr    = { fg = c.yellow,    bold = true },
    LineNr          = { fg = c.fg_subtle },
    LineNrAbove     = { fg = c.fg_subtle },
    LineNrBelow     = { fg = c.fg_subtle },
    ColorColumn     = { bg = c.bg1 },
    SignColumn      = { fg = c.fg_muted, bg = c.bg },
    SignColumnSB    = { fg = c.fg_muted, bg = c.bg1 },

    -- Selection
    Visual          = { bg = c.sel_bg },
    VisualNOS       = { bg = c.sel_bg },
    IncSearch       = { fg = c.bg,        bg = c.yellow },
    CurSearch       = { fg = c.bg,        bg = c.yellow },
    Search          = { fg = c.fg,        bg = c.bg3 },
    Substitute      = { fg = c.bg,        bg = c.red },

    -- Status / command line
    StatusLine      = { fg = c.fg_muted,  bg = c.bg3 },
    StatusLineNC    = { fg = c.fg_subtle, bg = c.bg3 },
    WinBar          = { fg = c.fg_muted,  bg = c.bg },
    WinBarNC        = { fg = c.fg_subtle, bg = c.bg },
    WinSeparator    = { fg = c.border },
    VertSplit       = { fg = c.border },

    -- Tabline
    TabLine         = { fg = c.fg_muted,  bg = c.bg3 },
    TabLineFill     = { bg = c.bg3 },
    TabLineSel      = { fg = c.fg,        bg = c.bg1, bold = true },

    -- Folds / columns
    Folded          = { fg = c.fg_dark,   bg = c.bg1 },
    FoldColumn      = { fg = c.fg_subtle, bg = c.bg },

    -- Popup menu
    Pmenu           = { fg = c.fg,        bg = c.bg_popup },
    PmenuSel        = { fg = c.fg,        bg = c.bg2, bold = true },
    PmenuSbar       = { bg = c.bg3 },
    PmenuThumb      = { bg = c.border },
    PmenuKind       = { fg = c.yellow,    bg = c.bg_popup },
    PmenuKindSel    = { fg = c.yellow,    bg = c.bg2 },
    PmenuExtra      = { fg = c.fg_muted,  bg = c.bg_popup },
    PmenuExtraSel   = { fg = c.fg_muted,  bg = c.bg2 },

    -- Messages
    ModeMsg         = { fg = c.yellow,    bold = true },
    MsgArea         = { fg = c.fg_muted },
    MoreMsg         = { fg = c.yellow },
    ErrorMsg        = { fg = c.error },
    WarningMsg      = { fg = c.warn },
    Question        = { fg = c.yellow },

    -- Misc
    NonText         = { fg = c.fg_subtle },
    EndOfBuffer     = { fg = c.bg },
    Whitespace      = { fg = c.border },
    SpecialKey      = { fg = c.fg_subtle },
    Directory       = { fg = c.yellow },
    Title           = { fg = c.yellow,    bold = true },
    Conceal         = { fg = c.fg_subtle },
    MatchParen      = { fg = c.yellow,    bold = true, underline = true },
    SpellBad        = { sp = c.error,     undercurl = true },
    SpellCap        = { sp = c.warn,      undercurl = true },
    SpellRare       = { sp = c.info,      undercurl = true },
    SpellLocal      = { sp = c.info,      undercurl = true },
    QuickFixLine    = { bg = c.bg2 },
    DiffAdd         = { bg = "#122b1e" },
    DiffChange      = { bg = "#1a2635" },
    DiffDelete      = { bg = "#2a1a1a" },
    DiffText        = { bg = "#1f3848" },

    -- ─── Base syntax ──────────────────────────────────────────────────────────
    Comment         = { fg = c.comment },
    Constant        = { fg = c.constant },
    String          = { fg = c.string },
    Character       = { fg = c.string },
    Number          = { fg = c.constant },
    Float           = { fg = c.constant },
    Boolean         = { fg = c.keyword },

    Identifier      = { fg = c.text },     -- variables, struct fields
    Function        = { fg = c.func },

    Statement       = { fg = c.keyword },
    Conditional     = { fg = c.keyword },
    Repeat          = { fg = c.keyword },
    Label           = { fg = c.keyword },
    Operator        = { fg = c.op },
    Keyword         = { fg = c.keyword },
    Exception       = { fg = c.keyword },

    PreProc         = { fg = c.keyword },
    Include         = { fg = c.keyword },
    Define          = { fg = c.keyword },
    Macro           = { fg = c.keyword },
    PreCondit       = { fg = c.keyword },

    Type            = { fg = c.func },     -- int, string, MyStruct — yellow, distinct from plain text
    StorageClass    = { fg = c.keyword },
    Structure       = { fg = c.keyword },
    Typedef         = { fg = c.func },     -- the name in a typedef — yellow

    Special         = { fg = c.builtin },
    SpecialChar     = { fg = c.blue },
    Tag             = { fg = c.keyword },
    Delimiter       = { fg = c.op },
    SpecialComment  = { fg = c.fg_muted },
    Debug           = { fg = c.red },

    Underlined      = { underline = true },
    Bold            = { bold = true },
    Italic          = { italic = true },
    Ignore          = { fg = c.fg_subtle },
    Error           = { fg = c.error },
    Todo            = { fg = c.yellow,    bold = true },
  }
end

return M

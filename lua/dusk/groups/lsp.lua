-- dusk: LSP highlights
-- Diagnostics, semantic tokens, LSP references, etc.

local M = {}

function M.get(c)
  return {
    -- ─── Diagnostics ──────────────────────────────────────────────────────────
    DiagnosticError             = { fg = c.error },
    DiagnosticWarn              = { fg = c.warn },
    DiagnosticInfo              = { fg = c.info },
    DiagnosticHint              = { fg = c.hint },
    DiagnosticOk                = { fg = c.fg_muted },

    DiagnosticUnderlineError    = { sp = c.error,  undercurl = true },
    DiagnosticUnderlineWarn     = { sp = c.warn,   undercurl = true },
    DiagnosticUnderlineInfo     = { sp = c.info,   undercurl = true },
    DiagnosticUnderlineHint     = { sp = c.hint,   undercurl = true },

    DiagnosticVirtualTextError  = { fg = c.error,  bg = "#1f1315" },
    DiagnosticVirtualTextWarn   = { fg = c.warn,   bg = "#1d1a12" },
    DiagnosticVirtualTextInfo   = { fg = c.info,   bg = "#111b22" },
    DiagnosticVirtualTextHint   = { fg = c.hint,   bg = "#161b1f" },

    DiagnosticFloatingError     = { fg = c.error },
    DiagnosticFloatingWarn      = { fg = c.warn },
    DiagnosticFloatingInfo      = { fg = c.info },
    DiagnosticFloatingHint      = { fg = c.hint },

    DiagnosticSignError         = { fg = c.error },
    DiagnosticSignWarn          = { fg = c.warn },
    DiagnosticSignInfo          = { fg = c.info },
    DiagnosticSignHint          = { fg = c.hint },

    DiagnosticDeprecated        = { fg = c.fg_subtle, strikethrough = true },
    DiagnosticUnnecessary       = { fg = c.fg_subtle },

    -- ─── LSP references ───────────────────────────────────────────────────────
    LspReferenceText            = { bg = c.bg2 },
    LspReferenceRead            = { bg = c.bg2 },
    LspReferenceWrite           = { bg = c.bg2, underline = true },
    LspSignatureActiveParameter = { fg = c.yellow, underline = true },
    LspInlayHint                = { fg = c.fg_subtle, bg = c.bg1 },
    LspCodeLens                 = { fg = c.fg_subtle },

    -- ─── Semantic tokens ──────────────────────────────────────────────────────
    -- Types → yellow (c.func). Names/vars → text. Keywords → red. Functions → yellow.
    ["@lsp.type.class"]            = { fg = c.func },    -- yellow: user-defined types
    ["@lsp.type.decorator"]        = { fg = c.yellow },
    ["@lsp.type.enum"]             = { fg = c.func },    -- yellow: enum types
    ["@lsp.type.enumMember"]       = { fg = c.constant },
    ["@lsp.type.function"]         = { fg = c.func },
    ["@lsp.type.interface"]        = { fg = c.func },    -- yellow: interfaces are types
    ["@lsp.type.keyword"]          = { fg = c.keyword },
    ["@lsp.type.macro"]            = { fg = c.func },
    ["@lsp.type.method"]           = { fg = c.func },
    ["@lsp.type.modifier"]         = { fg = c.keyword },
    ["@lsp.type.namespace"]        = { fg = c.text },
    ["@lsp.type.number"]           = { fg = c.constant },
    ["@lsp.type.operator"]         = { fg = c.op },
    ["@lsp.type.parameter"]        = { fg = c.text },
    ["@lsp.type.property"]         = { fg = c.text },
    ["@lsp.type.regexp"]           = { fg = c.blue },
    ["@lsp.type.string"]           = { fg = c.string },
    ["@lsp.type.struct"]           = { fg = c.func },    -- yellow: structs are types
    ["@lsp.type.type"]             = { fg = c.func },    -- yellow
    ["@lsp.type.typeParameter"]    = { fg = c.func },    -- yellow: generic type params
    ["@lsp.type.variable"]         = { fg = c.text },

    -- Modifiers (override type colors with modifiers)
    ["@lsp.typemod.function.defaultLibrary"]  = { fg = c.builtin },
    ["@lsp.typemod.variable.defaultLibrary"]  = { fg = c.builtin },
    ["@lsp.typemod.variable.globalScope"]     = { fg = c.text },
    ["@lsp.typemod.variable.readonly"]        = { fg = c.constant },
    ["@lsp.typemod.class.defaultLibrary"]     = { fg = c.func },
    ["@lsp.typemod.type.defaultLibrary"]      = { fg = c.func },
    ["@lsp.typemod.enumMember.defaultLibrary"]= { fg = c.constant },
  }
end

return M

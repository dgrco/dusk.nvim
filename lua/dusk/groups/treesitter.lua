-- dusk: treesitter highlight groups
-- These override the base groups with more granular control.
-- Philosophy: types get yellow (func color) to distinguish from plain text.
-- Keywords = red, strings = green, functions = yellow, types = yellow, names/vars = text.

local M = {}

function M.get(c)
  return {
    -- ─── Identifiers ──────────────────────────────────────────────────────────
    ["@variable"]                  = { fg = c.text },       -- any variable
    ["@variable.builtin"]          = { fg = c.builtin },    -- self, this, super
    ["@variable.parameter"]        = { fg = c.text },       -- function params — text
    ["@variable.member"]           = { fg = c.text },       -- struct fields — text

    -- ─── Constants ────────────────────────────────────────────────────────────
    ["@constant"]                  = { fg = c.constant },
    ["@constant.builtin"]          = { fg = c.builtin },    -- true, false, nil, null
    ["@constant.macro"]            = { fg = c.constant },

    -- ─── Strings ──────────────────────────────────────────────────────────────
    ["@string"]                    = { fg = c.string },
    ["@string.regexp"]             = { fg = c.str_esc },
    ["@string.escape"]             = { fg = c.str_esc },
    ["@string.special"]            = { fg = c.str_esc },
    ["@string.special.symbol"]     = { fg = c.string },
    ["@string.special.url"]        = { fg = c.string, underline = true },
    ["@character"]                 = { fg = c.string },
    ["@character.special"]         = { fg = c.str_esc },

    -- ─── Numbers ──────────────────────────────────────────────────────────────
    ["@number"]                    = { fg = c.constant },
    ["@number.float"]              = { fg = c.constant },
    ["@boolean"]                   = { fg = c.keyword },    -- true/false feel like keywords

    -- ─── Functions ────────────────────────────────────────────────────────────
    ["@function"]                  = { fg = c.func },       -- function definitions
    ["@function.builtin"]          = { fg = c.builtin },    -- built-in fns (len, print, make)
    ["@function.call"]             = { fg = c.func },       -- function calls
    ["@function.macro"]            = { fg = c.func },
    ["@function.method"]           = { fg = c.func },       -- method defs
    ["@function.method.call"]      = { fg = c.func },       -- method calls

    -- ─── Keywords ─────────────────────────────────────────────────────────────
    ["@keyword"]                   = { fg = c.keyword },
    ["@keyword.coroutine"]         = { fg = c.keyword },
    ["@keyword.function"]          = { fg = c.keyword },    -- func, fn, def, fun
    ["@keyword.operator"]          = { fg = c.keyword },    -- and, or, not, in
    ["@keyword.import"]            = { fg = c.keyword },    -- import, use, require
    ["@keyword.storage"]           = { fg = c.keyword },    -- static, pub, let, const
    ["@keyword.repeat"]            = { fg = c.keyword },    -- for, while, loop
    ["@keyword.return"]            = { fg = c.keyword },
    ["@keyword.debug"]             = { fg = c.red },
    ["@keyword.exception"]         = { fg = c.keyword },
    ["@keyword.conditional"]       = { fg = c.keyword },
    ["@keyword.conditional.ternary"] = { fg = c.op },

    -- ─── Types ────────────────────────────────────────────────────────────────
    -- Types are yellow — clearly distinct from plain text, without being loud.
    -- type Name struct → 'type' is red (keyword), 'Name' is yellow, 'struct' is red (keyword)
    ["@type"]                      = { fg = c.func },       -- MyStruct, int, string — yellow
    ["@type.builtin"]              = { fg = c.func },       -- int, bool, string, error — yellow
    ["@type.definition"]           = { fg = c.func },       -- the name in a type definition
    ["@type.qualifier"]            = { fg = c.keyword },    -- const, mut, pub

    -- ─── Attributes / decorators ──────────────────────────────────────────────
    ["@attribute"]                 = { fg = c.yellow },
    ["@attribute.builtin"]         = { fg = c.yellow },

    -- ─── Namespaces / modules ─────────────────────────────────────────────────
    ["@module"]                    = { fg = c.text },       -- fmt, os, std
    ["@module.builtin"]            = { fg = c.builtin },

    -- ─── Labels ───────────────────────────────────────────────────────────────
    ["@label"]                     = { fg = c.yellow },

    -- ─── Operators & punctuation ──────────────────────────────────────────────
    ["@operator"]                  = { fg = c.op },         -- +, -, *, :=, ->
    ["@punctuation.bracket"]       = { fg = c.op },         -- () [] {}
    ["@punctuation.delimiter"]     = { fg = c.op },         -- . , ; :
    ["@punctuation.special"]       = { fg = c.str_esc },   -- string interpolation #{}

    -- ─── Comments ─────────────────────────────────────────────────────────────
    ["@comment"]                   = { fg = c.comment },
    ["@comment.documentation"]     = { fg = c.comment },
    ["@comment.error"]             = { fg = c.error },
    ["@comment.warning"]           = { fg = c.warn },
    ["@comment.todo"]              = { fg = c.yellow,     bold = true },
    ["@comment.note"]              = { fg = c.info },

    -- ─── Markup (markdown, etc.) ──────────────────────────────────────────────
    ["@markup.strong"]             = { bold = true },
    ["@markup.italic"]             = { italic = true },
    ["@markup.strikethrough"]      = { strikethrough = true },
    ["@markup.underline"]          = { underline = true },
    ["@markup.heading"]            = { fg = c.yellow,     bold = true },
    ["@markup.heading.1"]          = { fg = c.yellow,     bold = true },
    ["@markup.heading.2"]          = { fg = c.func,       bold = true },
    ["@markup.heading.3"]          = { fg = c.text,       bold = true },
    ["@markup.quote"]              = { fg = c.fg_muted },
    ["@markup.math"]               = { fg = c.constant },
    ["@markup.link"]               = { fg = c.string,     underline = true },
    ["@markup.link.label"]         = { fg = c.string },
    ["@markup.link.url"]           = { fg = c.string,     underline = true },
    ["@markup.raw"]                = { fg = c.fg_muted },
    ["@markup.raw.block"]          = { fg = c.fg_muted },
    ["@markup.list"]               = { fg = c.op },
    ["@markup.list.checked"]       = { fg = c.fg_subtle },
    ["@markup.list.unchecked"]     = { fg = c.fg_muted },

    -- ─── Tags (HTML, JSX) ─────────────────────────────────────────────────────
    ["@tag"]                       = { fg = c.keyword },
    ["@tag.builtin"]               = { fg = c.keyword },
    ["@tag.attribute"]             = { fg = c.text },
    ["@tag.delimiter"]             = { fg = c.op },

    -- ─── Diffs ────────────────────────────────────────────────────────────────
    ["@diff.plus"]                 = { fg = c.git_add },
    ["@diff.minus"]                = { fg = c.git_del },
    ["@diff.delta"]                = { fg = c.git_change },
  }
end

return M

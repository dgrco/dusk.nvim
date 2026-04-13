-- lua/dusk/palette.lua
-- Thin shim kept for backward compatibility.
-- Real variant data lives in lua/dusk/variants/init.lua.
--
-- If you previously required this module directly:
--   local c = require("dusk.palette").colors
-- That still works — it returns the default "dusk" variant.

local variants = require("dusk.variants")

local M = {}

-- Default colors: the "dusk" variant with aliases applied.
M.colors = variants.with_aliases(variants.resolve("dusk"))

-- Resolve any variant by name (used by init.lua and the generator).
function M.get(name)
  return variants.with_aliases(variants.resolve(name or "dusk"))
end

return M

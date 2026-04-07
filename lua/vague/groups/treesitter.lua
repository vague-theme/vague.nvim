local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

    --stylua: ignore
  local hl = {
    ["@constant.builtin"]      = { fg = c.number, bold = conf.bold },
    ["@constructor"]           = { fg = c.constant },
    ["@constructor.lua"]       = { fg = c.type },
    ["@diff.plus"]             = { link = "DiffAdd" },
    ["@diff.delta"]            = { link = "DiffChange" },
    ["@diff.minus"]            = { link = "DiffDelete" },
    ["@function.builtin"]      = { fg = c.func },
    ["@function.call"]         = { fg = c.parameter },
    ["@function.macro"]        = { link = "Macro" },
    ["@function.method.call"]  = { fg = c.type },
    ["@keyword.import"]        = { link = "PreProc" },
    ["@keyword.return"]        = { fg = c.keyword, italic = conf.italic },
    ["@markup"]                = { fg = c.fg },
    ["@markup.heading"]        = { fg = c.keyword, bold = conf.bold },
    ["@markup.link"]           = {},
    ["@markup.link.label"]     = { fg = c.string, underline = true },
    ["@markup.link.url"]       = { fg = c.func },
    ["@markup.list"]           = { fg = c.func },
    ["@markup.math"]           = { fg = c.string },
    ["@markup.quote"]          = { fg = c.comment },
    ["@markup.raw"]            = { fg = c.constant },
    ["@property"]              = { fg = c.property },
    ["@punctuation.special"]   = { link = "SpecialChar" },
    ["@string.special.symbol"] = { link = "Identifier" },
    ["@string.special.url"]    = { fg = c.func },
    ["@tag.attribute"]         = { link = "Identifier" },
    ["@tag.delimiter"]         = { fg = c.fg },
    ["@type.builtin"]          = { fg = c.builtin, bold = conf.bold },
    ["@type.declaration"]      = { fg = c.constant },
    ["@type.definition"]       = { link = "Typedef" },
    ["@variable"]              = { fg = c.fg },
    ["@variable.member"]       = { fg = c.builtin },
    ["@variable.parameter"]    = { fg = c.parameter },
  }

  return hl
end
return M

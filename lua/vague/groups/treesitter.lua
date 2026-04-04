local syntax_group = require("vague.groups.syntax")
local diff_group = require("vague.groups.diff")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local syntax = syntax_group.get_colors(conf)
  local diff = diff_group.get_colors(conf)

    --stylua: ignore
  local hl = {
    ["@attribute"]             = syntax["Constant"],
    ["@boolean"]               = syntax["Boolean"],
    ["@character"]             = syntax["String"],
    ["@character.special"]     = syntax["SpecialChar"],
    ["@constant"]              = syntax["Constant"],
    ["@constant.builtin"]      = { fg = c.number, bold = conf.bold },
    ["@constructor"]           = { fg = c.constant },
    ["@constructor.lua"]       = { fg = c.type },
    ["@text.diff.add"]         = diff["DiffAdd"],
    ["@text.diff.delete"]      = diff["DiffDelete"],
    ["@diff.plus"]             = diff["DiffAdd"],
    ["@diff.delta"]            = diff["DiffChange"],
    ["@diff.minus"]            = diff["DiffDelete"],
    ["@function"]              = syntax["Function"],
    ["@function.builtin"]      = { fg = c.func },
    ["@function.call"]         = { fg = c.parameter },
    ["@function.macro"]        = syntax["Macro"],
    ["@function.method.call"]  = { fg = c.type },
    ["@keyword"]               = { fg = c.keyword },
    ["@keyword.conditional"]   = { fg = c.keyword },
    ["@keyword.exception"]     = syntax["Exception"],
    ["@keyword.import"]        = syntax["PreProc"],
    ["@keyword.operator"]      = { fg = c.keyword },
    ["@keyword.return"]        = { fg = c.keyword, italic = conf.italic },
    ["@label"]                 = syntax["Label"],
    ["@markup"]                = { fg = c.fg },
    ["@markup.heading"]        = { fg = c.keyword, bold = conf.bold },
    ["@markup.italic"]         = { fg = c.fg, italic = conf.italic },
    ["@markup.link"]           = {},
    ["@markup.link.label"]     = { fg = c.string, underline = true },
    ["@markup.link.url"]       = { fg = c.func },
    ["@markup.list"]           = { fg = c.func },
    ["@markup.math"]           = { fg = c.string },
    ["@markup.quote.markdown"] = { fg = c.comment },
    ["@markup.raw"]            = { fg = c.constant },
    ["@markup.strikethrough"]  = { fg = c.comment, strikethrough = true },
    ["@markup.strong"]         = { fg = c.fg, bold = conf.bold },
    ["@markup.underline"]      = { fg = c.fg, underline = true },
    ["@module"]                = syntax["Constant"],
    ["@number"]                = syntax["Number"],
    ["@number.float"]          = syntax["Float"],
    ["@operator"]              = syntax["Operator"],
    ["@property"]              = { fg = c.property },
    ["@punctuation.special"]   = syntax["SpecialChar"],
    ["@string"]                = syntax["String"],
    ["@string.escape"]         = syntax["SpecialChar"],
    ["@string.regexp"]         = syntax["SpecialChar"],
    ["@string.special.symbol"] = syntax["Identifier"],
    ["@string.special.url"]    = { fg = c.func },
    ["@tag.attribute"]         = syntax["Identifier"],
    ["@tag.delimiter"]         = { fg = c.fg },
    ["@type"]                  = syntax["Type"],
    ["@type.builtin"]          = { fg = c.builtin, bold = conf.bold },
    ["@type.declaration"]      = { fg = c.constant },
    ["@type.definition"]       = syntax["Typedef"],
    ["@variable"]              = { fg = c.fg },
    ["@variable.builtin"]      = { fg = c.builtin },
    ["@variable.member"]       = { fg = c.builtin },
    ["@variable.parameter"]    = { fg = c.parameter },
  }

  return hl
end
return M

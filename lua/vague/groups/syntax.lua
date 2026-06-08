local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

    -- stylua: ignore
  local hl = {
    Boolean         = { fg = c.number, bold = conf.bold },
    Character       = { fg = c.string },
    Comment         = { fg = c.comment, italic = conf.italic },
    Conditional     = { fg = c.keyword },
    Constant        = { fg = c.constant },
    Delimiter       = { fg = c.fg },
    Error           = { bg = c.error, bold = conf.bold },
    Exception       = { fg = c.keyword },
    Float           = { fg = c.number },
    Function        = { fg = c.func },
    Identifier      = { fg = c.constant },
    Include         = { fg = c.keyword },
    Keyword         = { fg = c.keyword },
    Label           = { fg = c.keyword },
    Number          = { fg = c.number },
    Operator        = { fg = c.operator },
    PreProc         = { fg = c.keyword },
    Repeat          = { fg = c.keyword },
    Special         = { fg = c.builtin },
    SpecialChar     = { fg = c.keyword },
    SpecialComment  = { fg = c.keyword },
    Statement       = { fg = c.keyword },
    StorageClass    = { fg = c.constant },
    String          = { fg = c.string, italic = conf.italic },
    Structure       = { fg = c.constant },
    Tag             = { fg = c.builtin },
    Title           = { fg = c.property },
    Todo            = { fg = c.func, italic = conf.italic },
    Type            = { fg = c.type },
    Typedef         = { fg = c.constant },
  }

  return hl
end
return M

local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

    -- stylua: ignore
  local hl = {
    Boolean         = { fg = c.number, bold = conf.bold },                     -- boolean constants
    Character       = { fg = c.string },                                       -- character constants
    Comment         = { fg = c.comment, italic = conf.italic },                -- comments
    Conditional     = { fg = c.keyword },                                      -- conditionals
    Constant        = { fg = c.constant },                                     -- (preferred) any constant
    Define          = { fg = c.comment },                                      -- preprocessor '#define'
    Delimiter       = { fg = c.fg },                                           -- delimiter characters
    Error           = { bg = c.error, bold = conf.bold },                      -- (preferred) any erroneous construct
    Exception       = { fg = c.keyword },                                      -- 'try', 'catch', 'throw'
    Float           = { fg = c.number },                                       -- float constants
    Function        = { fg = c.func },                                         -- functions
    Identifier      = { fg = c.constant },                                     -- (preferred) any variable
    Include         = { fg = c.keyword },                                      -- preprocessor '#include'
    Keyword         = { fg = c.keyword },                                      -- any other keyword
    Label           = { fg = c.keyword },                                      -- 'case', 'default', etc
    Macro           = { fg = c.constant },                                     -- macros
    Number          = { fg = c.number },                                       -- number constant
    Operator        = { fg = c.operator },                                     -- '+', '*', 'sizeof' etc
    PreCondit       = { fg = c.comment },                                      -- preprocessor conditionals '#if', '#endif' etc
    PreProc         = { fg = c.constant },                                     -- (preferred) generic preprocessor
    Repeat          = { fg = c.keyword },                                      -- loop keywords: 'for', 'while' etc
    Special         = { fg = c.builtin },                                      -- (preferred) any special symbol
    SpecialChar     = { fg = c.keyword },                                      -- special character in a constant
    SpecialComment  = { fg = c.keyword },                                      -- special things inside comments
    Statement       = { fg = c.keyword },                                      -- (preferred) any statement
    StorageClass    = { fg = c.constant },                                     -- 'static', 'volatile' etc
    String          = { fg = c.string, italic = conf.italic },                 -- string constants
    Structure       = { fg = c.constant },                                     -- 'struct', 'union', 'enum' etc
    Tag             = { fg = c.builtin },                                      -- can use <C-]> on this
    Title           = { fg = c.property },
    Todo            = { fg = c.func, italic = conf.italic },                   -- (preferred) 'TODO' keywords in comments
    Type            = { fg = c.type },                                         -- (preferred) 'int', 'long', 'char' etc
    Typedef         = { fg = c.constant },                                     -- 'typedef'
  }

  return hl
end
return M

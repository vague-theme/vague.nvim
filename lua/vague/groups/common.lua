local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    ColorColumn      = { bg = c.line },
    Conceal          = { fg = c.func },
    CurSearch        = { fg = c.fg, bg = c.search },
    CursorColumn     = { bg = c.line },
    CursorLine       = { bg = c.line },
    CursorLineNr     = { fg = c.fg },
    Debug            = { fg = c.constant },
    debugPC          = { fg = c.bg, bg = c.fg },
    debugBreakpoint  = { fg = c.bg, bg = c.operator },
    Directory        = { fg = c.hint },
    OkMsg            = { fg = c.plus },
    ErrorMsg         = { fg = c.error, gui = "bold" },
    EndOfBuffer      = { fg = c.comment },
    FloatBorder      = { fg = c.floatBorder, bg = conf.transparent and "none" or c.bg },
    FloatTitle       = { fg = c.floatBorder, bg = conf.transparent and "none" or c.bg },
    FloatFooter      = { fg = c.floatBorder, bg = conf.transparent and "none" or c.bg },
    Folded           = { fg = c.comment, bg = conf.transparent and "none" or c.line },
    FoldColumn       = { fg = c.comment, bg = conf.transparent and "none" or c.bg },
    IncSearch        = { fg = c.bg, bg = c.search },
    LineNr           = { fg = c.comment },
    MatchParen       = { fg = c.fg, bg = c.visual },
    MoreMsg          = { fg = c.func, gui = "bold" },
    MsgSeparator     = { fg = c.string, bg = c.line, gui = "bold" },
    NonText          = { fg = c.comment },
    Normal           = { fg = c.fg, bg = conf.transparent and "none" or c.bg },
    NormalFloat      = { fg = c.fg, bg = conf.transparent and "none" or c.bg },
    ModeMsg          = { fg = c.string },
    Pmenu            = { fg = c.fg },
    PmenuSel         = { fg = c.constant, bg = c.line },
    PmenuThumb       = { bg = c.comment },
    PmenuBorder      = { fg = c.floatBorder },
    Question         = { fg = c.constant },
    QuickFixLine     = { fg = c.func, gui = "underline" },
    Search           = { fg = c.fg, bg = c.search },
    SignColumn       = { fg = c.fg, bg = conf.transparent and "none" or c.bg },
    SpecialKey       = { fg = c.comment },
    SpellBad         = { gui = "undercurl" },
    SpellCap         = { gui = "undercurl" },
    SpellLocal       = { gui = "undercurl" },
    SpellRare        = { gui = "undercurl" },
    StatusLine       = { fg = c.fg, bg = c.inactiveBg },
    StatusLineTerm   = { fg = c.fg, bg = c.inactiveBg },
    StatusLineNC     = { fg = c.comment },
    StatusLineTermNC = { fg = c.comment },
    Substitute       = { fg = c.type, bg = c.visual },
    TabLine          = { fg = c.fg, bg = c.line },
    TabLineFill      = { fg = c.comment, bg = c.line },
    TabLineSel       = { fg = c.bg, bg = c.fg },
    Terminal         = { fg = c.fg, bg = conf.transparent and "none" or c.bg },
    ToolbarButton    = { fg = c.bg, bg = c.visual },
    ToolbarLine      = { fg = c.fg },
    Visual           = { bg = c.visual },
    VisualNOS        = { bg = c.comment, gui = "underline" },
    WarningMsg       = { fg = c.warning, gui = "bold" },
    Whitespace       = { fg = c.comment },
    WildMenu         = { fg = c.bg, bg = c.func },
    WinSeparator     = { fg = c.floatBorder },
    WinBar           = { fg = c.fg, bg = c.inactiveBg },
    WinBarNC         = { fg = c.comment },
  }

  return hl
end
return M

local M = {}

---@param highlights table <string, table>
local function set_vim_highlights(highlights)
  local conf = require("vague.config.internal").current
  for name, setting in pairs(highlights) do
    if setting.gui == "bold" and not conf.bold then
      setting.gui = "none"
    elseif setting.gui == "italic" and not conf.italic then
      setting.gui = "none"
    end
    vim.api.nvim_command(
      string.format(
        "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
        name,
        setting.fg or "none",
        setting.bg or "none",
        setting.sp or "none",
        setting.gui or "none"
      )
    )
  end
end

M.set_highlights = function()
  local conf = require("vague.config.internal").current
  local utilities = require("vague.utilities")
  local c = conf.colors

  local diffAdd = utilities.blend(c.plus, c.bg, 0.2)
  local diffChange = utilities.blend(c.delta, c.bg, 0.2)
  local diffDelete = utilities.blend(c.error, c.bg, 0.2)

  local highlights = {
    ColorColumn = { bg = c.line },
    Conceal = { fg = c.func },
    CurSearch = { fg = c.fg, bg = c.search },
    CursorColumn = { bg = c.line },
    CursorLine = { bg = c.line },
    CursorLineNr = { fg = c.fg },
    Debug = { fg = c.constant },
    debugPC = { fg = c.bg, bg = c.fg },
    debugBreakpoint = { fg = c.bg, bg = c.operator },
    Directory = { fg = c.hint },
    OkMsg = { fg = c.plus },
    ErrorMsg = { fg = c.error, gui = "bold" },
    EndOfBuffer = { fg = c.comment },
    FloatBorder = { fg = c.floatBorder, bg = conf.transparent and "none" or c.bg },
    FloatTitle = { fg = c.floatBorder, bg = conf.transparent and "none" or c.bg },
    FloatFooter = { fg = c.floatBorder, bg = conf.transparent and "none" or c.bg },
    Folded = { fg = c.comment, bg = conf.transparent and "none" or c.line },
    FoldColumn = { fg = c.comment, bg = conf.transparent and "none" or c.bg },
    IncSearch = { fg = c.bg, bg = c.search },
    LineNr = { fg = c.comment },
    MatchParen = { fg = c.fg, bg = c.visual },
    MoreMsg = { fg = c.func, gui = "bold" },
    MsgSeparator = { fg = c.string, bg = c.line, gui = "bold" },
    NonText = { fg = c.comment },
    Normal = { fg = c.fg, bg = conf.transparent and "none" or c.bg },
    NormalFloat = { fg = c.fg, bg = conf.transparent and "none" or c.bg },
    ModeMsg = { fg = c.string },
    Pmenu = { fg = c.fg },
    PmenuSel = { fg = c.constant, bg = c.line },
    PmenuThumb = { bg = c.comment },
    PmenuBorder = { fg = c.floatBorder },
    Question = { fg = c.constant },
    QuickFixLine = { fg = c.func, gui = "underline" },
    Search = { fg = c.fg, bg = c.search },
    SignColumn = { fg = c.fg, bg = conf.transparent and "none" or c.bg },
    SpecialKey = { fg = c.comment },
    SpellBad = { gui = "undercurl" },
    SpellCap = { gui = "undercurl" },
    SpellLocal = { gui = "undercurl" },
    SpellRare = { gui = "undercurl" },
    StatusLine = { fg = c.fg, bg = c.inactiveBg },
    StatusLineTerm = { fg = c.fg, bg = c.inactiveBg },
    StatusLineNC = { fg = c.comment },
    StatusLineTermNC = { fg = c.comment },
    Substitute = { fg = c.type, bg = c.visual },
    TabLine = { fg = c.fg, bg = c.line },
    TabLineFill = { fg = c.comment, bg = c.line },
    TabLineSel = { fg = c.bg, bg = c.fg },
    Terminal = { fg = c.fg, bg = conf.transparent and "none" or c.bg },
    ToolbarButton = { fg = c.bg, bg = c.visual },
    ToolbarLine = { fg = c.fg },
    Visual = { bg = c.visual },
    VisualNOS = { bg = c.comment, gui = "underline" },
    WarningMsg = { fg = c.warning, gui = "bold" },
    Whitespace = { fg = c.comment },
    WildMenu = { fg = c.bg, bg = c.func },
    WinSeparator = { fg = c.floatBorder },
    Added = { fg = c.plus },
    Changed = { fg = c.delta },
    Removed = { fg = c.error },
    DiffAdd = { bg = diffDelete },
    DiffChange = { bg = diffChange },
    DiffDelete = { bg = diffDelete },
    DiffText = { fg = c.fg },
    DiffFile = { fg = c.keyword },
    DiffIndexLine = { fg = c.comment },

    Boolean = { fg = c.number, gui = conf.style.boolean },
    Character = { fg = c.string },
    Comment = { fg = c.comment, gui = conf.style.comments },
    Conditional = { fg = c.keyword, gui = conf.style.conditionals },
    Constant = { fg = c.constant }, -- (preferred) any constant
    Define = { fg = c.comment }, -- preprocessor '#define'
    Delimiter = { fg = c.fg },
    Error = { fg = c.error, gui = conf.style.error }, -- (preferred) any erroneous construct
    Exception = { fg = c.keyword, gui = conf.style.keywords_exception }, -- 'try', 'catch', 'throw'
    Float = { fg = c.number, gui = conf.style.float },
    Function = { fg = c.func, gui = conf.style.functions },
    Identifier = { fg = c.constant, gui = conf.style.variables }, -- (preferred) any variable
    Include = { fg = c.keyword }, -- preprocessor '#include'
    Keyword = { fg = c.keyword, gui = conf.style.keywords },
    Label = { fg = c.keyword, gui = conf.style.keywords_label }, -- 'case', 'default', etc
    Macro = { fg = c.constant },
    Number = { fg = c.number, gui = conf.style.number },
    Operator = { fg = c.operator, gui = conf.style.operators }, -- '+', '*', 'sizeof' etc
    PreCondit = { fg = c.comment }, -- preprocessor conditionals '#if', '#endif' etc
    PreProc = { fg = c.constant }, -- (preferred) generic preprocessor
    Repeat = { fg = c.keyword, gui = conf.style.keywords_loop }, -- loop keywords: 'for', 'while' etc
    Special = { fg = c.builtin }, -- (preferred) any special symbol
    SpecialChar = { fg = c.keyword }, -- special character in a constant
    SpecialComment = { fg = c.keyword }, -- special things inside comments
    Statement = { fg = c.keyword }, -- (preferred) any statement
    StorageClass = { fg = c.constant }, -- 'static', 'volatile' etc
    String = { fg = c.string, gui = conf.style.strings },
    Structure = { fg = c.constant }, -- 'struct', 'union', 'enum' etc
    Tag = { fg = c.builtin },
    Title = { fg = c.property },
    Todo = { fg = c.func, gui = conf.style.comments }, -- (preferred) 'TODO' keywords in comments
    Type = { fg = c.type }, -- (preferred) 'int', 'long', 'char' etc
    Typedef = { fg = c.constant }, -- 'typedef'

    ["@attribute"] = { fg = c.constant }, -- attributes, like <decorators> in python
    ["@boolean"] = { fg = c.number, gui = conf.style.boolean },
    ["@character"] = { fg = c.string, gui = conf.style.strings },
    ["@character.special"] = { fg = c.keyword },
    ["@constant"] = { fg = c.constant },
    ["@constant.builtin"] = { fg = c.number, gui = conf.style.builtin_constants }, -- constants defined by the language, like 'nil' in Lua
    ["@constructor"] = { fg = c.constant, gui = conf.style.functions }, -- constructor calls and definitions
    ["@constructor.lua"] = { fg = c.type, gui = conf.style.functions }, -- constructor calls and definitions, `= { }` in Lua
    ["@text.diff.add"] = { bg = diffAdd },
    ["@text.diff.delete"] = { bg = diffDelete },
    ["@diff.plus"] = { bg = diffAdd },
    ["@diff.delta"] = { bg = diffChange },
    ["@diff.minus"] = { bg = diffDelete },
    ["@function"] = { fg = c.func, gui = conf.style.functions },
    ["@function.builtin"] = { fg = c.func, gui = conf.style.builtin_functions },
    ["@function.call"] = { fg = c.parameter },
    ["@function.macro"] = { fg = c.constant },
    ["@function.method.call"] = { fg = c.type },
    ["@keyword"] = { fg = c.keyword, gui = conf.style.keywords },
    ["@keyword.conditional"] = { fg = c.keyword, gui = conf.style.conditionals }, --
    ["@keyword.exception"] = { fg = c.keyword, gui = conf.style.keywords_exception },
    ["@keyword.import"] = { fg = c.constant },
    ["@keyword.operator"] = { fg = c.keyword, gui = conf.style.operators }, -- operator keywords (e.g., 'in' in Python)
    ["@keyword.return"] = { fg = c.keyword, gui = conf.style.keyword_return },
    ["@label"] = { fg = c.keyword, gui = conf.style.keywords_label },
    ["@markup"] = { fg = c.fg }, -- text in markup languages
    ["@markup.heading"] = { fg = c.keyword, gui = conf.style.headings }, -- markdown titles
    ["@markup.italic"] = { fg = c.fg, gui = "italic" }, -- italic text
    ["@markup.link"] = { fg = c.string }, -- text references, footnotes, citations, etc.
    ["@markup.link.uri"] = { fg = c.string, gui = "underline" }, -- URLs, links, emails
    ["@markup.list"] = { fg = c.func },
    ["@markup.math"] = { fg = c.string }, -- math environments, like `$$` in LaTeX
    ["@markup.quote.markdown"] = { fg = c.comment }, -- quotes with '>'
    ["@markup.raw"] = { fg = c.constant }, -- inline code in markdown
    ["@markup.strikethrough"] = { fg = c.comment, gui = "strikethrough" }, -- strikethrough text
    ["@markup.strong"] = { fg = c.fg, gui = "bold" },
    ["@markup.underline"] = { fg = c.fg, gui = "underline" },
    ["@module"] = { fg = c.constant },
    ["@number"] = { fg = c.number, gui = conf.style.number },
    ["@number.float"] = { fg = c.number, gui = conf.style.float },
    ["@operator"] = { fg = c.operator, gui = conf.style.operators },
    ["@property"] = { fg = c.property },
    ["@punctuation.special"] = { fg = c.keyword }, -- special punctuation (e.g., `{}` in string interpolation)
    ["@string"] = { fg = c.string, gui = conf.style.strings },
    ["@string.escape"] = { fg = c.keyword }, -- escape characters within strings
    ["@string.regexp"] = { fg = c.keyword }, -- regular expressions
    ["@string.special.symbol"] = { fg = c.constant, gui = conf.style.variables }, -- special symbols in strings
    ["@string.special.url"] = { fg = c.func }, -- URLs, links, emails
    ["@tag.attribute"] = { fg = c.constant, gui = conf.style.variables }, -- tag attributes, like in HTML
    ["@tag.delimiter"] = { fg = c.fg }, -- tag delimiters like `< >`
    ["@type"] = { fg = c.type },
    ["@type.builtin"] = { fg = c.builtin, gui = conf.style.builtin_types },
    ["@type.declaration"] = { fg = c.constant },
    ["@type.definition"] = { fg = c.constant },
    ["@variable"] = { fg = c.fg, gui = conf.style.variables },
    ["@variable.builtin"] = { fg = c.builtin, gui = conf.style.builtin_variables }, -- built-in variables like 'self' or 'this'
    ["@variable.member"] = { fg = c.builtin }, -- fields
    ["@variable.parameter"] = { fg = c.parameter }, -- function parameters

    TreesitterContext = { bg = c.line },
    TreesitterContextLineNumber = { fg = c.comment, bg = c.line },

    DiagnosticError = { fg = c.error, gui = conf.plugins.lsp.diagnostic_error },
    DiagnosticHint = { fg = c.hint, gui = conf.plugins.lsp.diagnostic_hint },
    DiagnosticInfo = { fg = c.constant, gui = conf.plugins.lsp.diagnostic_info },
    DiagnosticOk = { fg = c.plus, gui = conf.plugins.lsp.diagnostic_ok },
    DiagnosticUnderlineError = { gui = "undercurl", sp = c.error },
    DiagnosticUnderlineHint = { gui = "undercurl", sp = c.hint },
    DiagnosticUnderlineInfo = { gui = "undercurl", sp = c.constant },
    DiagnosticUnderlineOk = { gui = "undercurl", sp = c.plus },
    DiagnosticUnderlineWarn = { gui = "undercurl", sp = c.delta },
    DiagnosticVirtualTextError = { fg = c.error, gui = conf.plugins.lsp.diagnostic_error },
    DiagnosticVirtualTextHint = { fg = c.hint, gui = conf.plugins.lsp.diagnostic_hint },
    DiagnosticVirtualTextInfo = { fg = c.constant, gui = conf.plugins.lsp.diagnostic_info },
    DiagnosticVirtualTextOk = { fg = c.plus, gui = conf.plugins.lsp.diagnostic_ok },
    DiagnosticVirtualTextWarn = { fg = c.warning, gui = conf.plugins.lsp.diagnostic_warn },
    DiagnosticWarn = { fg = c.warning, gui = conf.plugins.lsp.diagnostic_warn },
    LspCodeLens = { fg = c.comment, gui = conf.style.comments }, -- code lens text
    LspCodeLensSeparator = { fg = c.comment }, -- code lens separator
    LspCxxHlGroupEnumConstant = { fg = c.type }, -- C++ enum constants
    LspCxxHlGroupMemberVariable = { fg = c.type }, -- C++ member variables
    LspCxxHlGroupNamespace = { fg = c.func }, -- C++ namespaces
    LspCxxHlSkippedRegion = { fg = c.comment }, -- C++ skipped regions
    LspCxxHlSkippedRegionBeginEnd = { fg = c.operator }, -- C++ skipped region begin/end
    LspReferenceRead = { bg = c.comment }, -- reference read
    LspReferenceText = { bg = c.comment }, -- reference text
    LspReferenceWrite = { bg = c.comment }, -- reference write

    ["@lsp.type.builtinConstant"] = { fg = c.number, gui = conf.style.builtin_constants },
    ["@lsp.type.builtinType"] = { fg = c.builtin, gui = conf.style.builtin_types },
    ["@lsp.type.class"] = { fg = c.constant },
    ["@lsp.type.comment"] = { fg = c.comment, gui = conf.style.comments },
    ["@lsp.type.enum"] = { fg = c.constant },
    ["@lsp.type.enumMember"] = { fg = c.builtin },
    ["@lsp.type.function"] = { fg = c.parameter },
    ["@lsp.type.generic"] = { fg = c.type },
    ["@lsp.type.interface"] = { fg = c.constant },
    ["@lsp.type.macro"] = { fg = c.constant },
    ["@lsp.type.namespace"] = { fg = c.constant },
    ["@lsp.type.parameter"] = { fg = c.parameter },
    ["@lsp.type.property"] = { fg = c.type },
    ["@lsp.type.selfParameter"] = { fg = c.builtin },
    ["@lsp.type.typeParameter"] = { fg = c.constant },
    ["@lsp.type.variable"] = { fg = c.constant },
    ["@lsp.typemod.function"] = { fg = c.parameter },
    ["@lsp.typemod.function.builtin"] = { fg = c.func, gui = conf.style.builtin_functions },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = c.func, gui = conf.style.builtin_functions },
    ["@lsp.typemod.function.definition"] = { fg = c.func, gui = conf.style.functions },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = c.number, gui = conf.style.builtin_constants },
    ["@lsp.typemod.variable.definition"] = { fg = c.property },

    netrwTreeBar = { fg = c.comment },
    netrwClassify = { fg = c.hint },

    CmpGhostText = { fg = c.comment }, -- ghost text for completion
    CmpItemAbbr = { fg = c.fg }, -- abbreviation in completion menu
    CmpItemAbbrDeprecated = { fg = c.error, strikethrough = true }, -- deprecated items in completion menu
    CmpItemAbbrMatch = { fg = c.delta, gui = conf.plugins.cmp.match }, -- matched text in completion menu
    CmpItemAbbrMatchFuzzy = { fg = c.delta, gui = conf.plugins.cmp.match_fuzzy }, -- fuzzy-matched text in completion menu
    CmpItemMenu = { fg = c.fg }, -- menu for completion items
    CmpItemKind = { fg = c.comment }, -- kind of completion item

    BlinkCmpDocBorder = { fg = c.floatBorder }, -- border for completion documentation
    BlinkCmpGhostText = { fg = c.comment }, -- ghost text in completion
    BlinkCmpLabel = { fg = c.fg }, -- label for completion items
    BlinkCmpLabelDeprecated = { fg = c.error, strikethrough = true }, -- deprecated label in completion
    BlinkCmpLabelMatch = { fg = c.delta, gui = conf.plugins.cmp.match }, -- matched label in completion items
    BlinkCmpMenu = { fg = c.fg }, -- menu for completion items
    BlinkCmpMenuBorder = { fg = c.floatBorder }, -- border for completion menu
    BlinkCmpKind = { fg = c.comment }, -- kind of completion item
    BlinkCmpSignatureHelpBorder = { fg = c.floatBorder }, -- border for signature help

    RainbowDelimiterRed = { fg = c.error },
    RainbowDelimiterOrange = { fg = c.func },
    RainbowDelimiterYellow = { fg = c.warning },
    RainbowDelimiterGreen = { fg = c.plus },
    RainbowDelimiterBlue = { fg = c.hint },
    RainbowDelimiterViolet = { fg = c.parameter },
    RainbowDelimiterCyan = { fg = c.keyword },

    ExtraWhitespace = { fg = c.fg, bg = c.error },

    FzfLuaHeaderBind = { fg = c.constant },
    FzfLuaHeaderText = { fg = c.parameter },
    FzfLuaBorder = { fg = c.floatBorder, bg = conf.transparent and "none" or c.bg },
    FzfLuaPathLineNr = { fg = c.string },
    FzfLuaPathColNr = { fg = c.parameter },
    FzfLuaLivePrompt = { fg = c.constant },
    FzfLuaLiveSym = { fg = c.string },
    FzfLuaBufNr = { fg = c.string },
    FzfLuaBufFlagCur = { fg = c.keyword },
    FzfLuaBufFlagAlt = { fg = c.keyword },
    FzfLuaTabTitle = { fg = c.type },
    FzfLuaTabMarker = { fg = c.constant },

    NeoTreeNormal = { fg = c.fg, bg = conf.transparent and "none" or c.bg }, -- normal text in NeoTree
    NeoTreeNormalNC = { fg = c.fg, bg = conf.transparent and "none" or c.bg }, -- normal text in NeoTree (non-current)
    NeoTreeVertSplit = { fg = c.comment, bg = conf.transparent and "none" or c.comment }, -- vertical split in NeoTree
    NeoTreeWinSeparator = { fg = c.comment, bg = conf.transparent and "none" or c.comment }, -- window separator in NeoTree
    NeoTreeEndOfBuffer = { fg = c.comment, bg = conf.transparent and "none" or c.bg }, -- end of buffer in NeoTree
    NeoTreeRootName = { fg = c.hint }, -- root directory name in NeoTree
    NeoTreeGitAdded = { fg = c.plus }, -- added Git changes in NeoTree
    NeoTreeGitDeleted = { fg = c.error }, -- deleted Git changes in NeoTree
    NeoTreeGitModified = { fg = c.delta }, -- modified Git changes in NeoTree
    NeoTreeGitConflict = { fg = c.error, gui = "bold" }, -- Git conflict in NeoTree
    NeoTreeGitUntracked = { fg = c.error }, -- untracked Git files in NeoTree
    NeoTreeIndentMarker = { fg = c.comment }, -- indent markers in NeoTree
    NeoTreeSymbolicLinkTarget = { fg = c.hint }, -- symbolic links in NeoTree

    TelescopeBorder = { fg = c.floatBorder }, -- Border for Telescope
    TelescopeMatching = { fg = c.delta, gui = conf.plugins.telescope.match }, -- Matching text in Telescope
    TelescopePromptPrefix = { fg = c.constant }, -- Prefix in Telescope prompt
    TelescopeSelection = { fg = c.constant, bg = c.line }, -- Selection in Telescope
    TelescopeSelectionCaret = { fg = c.constant }, -- Caret in Telescope selection
    TelescopeResultsNormal = { fg = c.fg }, -- Normal text in Telescope results

    SnacksIndentChunk = { fg = c.comment },
    SnacksIndent = { fg = c.comment },
    SnacksIndentScope = { fg = c.comment },

    SnacksInputBorder = { fg = c.floatBorder },
    SnacksInputPrompt = { fg = c.comment },
    SnacksInputTitle = { fg = c.constant },
    SnacksInputIcon = { fg = c.constant },

    SnacksPickerMatch = { fg = c.delta, gui = conf.plugins.telescope.match }, -- Matching text in picker
    SnacksPickerPrompt = { fg = c.constant }, -- Prefix in picker prompt
    SnacksPickerBorder = { fg = c.floatBorder }, -- Border for Telescope
    SnacksPickerBoxBorder = { fg = c.floatBorder }, -- Border for Telescope
    SnacksPickerListBorder = { fg = c.floatBorder }, -- Border for Telescope
    SnacksPickerInputBorder = { fg = c.floatBorder }, -- Border for Telescope
    SnacksPickerPrewviewBorder = { fg = c.floatBorder }, -- Border for Telescope
    SnacksPickerCursorLine = { fg = c.constant, bg = c.line }, -- Selection in picker
    SnacksPickerBoxCursorLine = { fg = c.constant, bg = c.line }, -- Selection in picker
    SnacksPickerListCursorLine = { fg = c.constant, bg = c.line }, -- Selection in picker
    SnacksPickerInputCursorLine = { fg = c.constant, bg = c.line }, -- Selection in picker
    SnacksPickerPreviewCursorLine = { fg = c.constant, bg = c.line }, -- Selection in picker
    SnacksPickerGitStatusUntracked = { fg = c.error }, -- color of untracked git items in a picker (usually explorer)
    SnacksPickerGitStatusAdded = { fg = c.plus }, -- color of added git items in a picker (usually explorer)
    SnacksPickerGitStatusModified = { fg = c.delta }, -- color of modified git items in a picker (usually explorer)
    SnacksPickerGitStatusStaged = { fg = c.plus }, -- color of added git items in a picker (usually explorer)

    MiniDiffOverContext = { bg = c.line },
    MiniDiffSignAdd = { fg = c.plus },
    MiniDiffSignChange = { fg = c.delta },
    MiniDiffSignDelete = { fg = c.error },

    MiniTrailspace = { bg = c.error },

    MiniStatuslineModeNormal = { fg = c.bg, bg = c.operator, gui = "bold" },
    MiniStatuslineModeInsert = { fg = c.bg, bg = c.delta, gui = "bold" },
    MiniStatuslineModeVisual = { fg = c.bg, bg = c.builtin, gui = "bold" },
    MiniStatuslineModeReplace = { fg = c.bg, bg = c.string, gui = "bold" },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.string, gui = "bold" },
    MiniStatuslineModeOther = { fg = c.bg, bg = c.string, gui = "bold" },
    MiniStatuslineDevinfo = { fg = c.fg, bg = c.inactiveBg },
    MiniStatuslineFilename = { fg = c.comment, bg = c.bg },
    MiniStatuslineFileinfo = { fg = c.fg, bg = c.inactiveBg },
    MiniStatuslineInactive = { fg = c.comment, bg = c.bg },

    DashboardShortCut = { fg = c.parameter },
    DashboardHeader = { fg = c.constant },
    DashboardCenter = { fg = c.constant },
    DashboardFooter = { fg = c.delta, gui = conf.plugins.dashboard.footer },

    NeotestTest = { fg = c.comment },
    NeotestUnknown = { fg = c.fg },
    NeotestDir = { fg = c.comment },
    NeotestFile = { fg = c.constant },
    NeotestPassed = { fg = c.plus },
    NeotestFailed = { fg = c.error },
    NeotestMarked = { fg = c.delta },
    NeotestWatching = { fg = c.warning }, -- Watching status for tests
    NeotestTarget = { fg = c.hint },
    NeotestFocused = { fg = c.delta, gui = conf.plugins.neotest.focused },
    NeotestRunning = { fg = c.hint },
    NeotestAdapterName = { fg = c.hint, gui = conf.plugins.neotest.adapter_name },
    NeotestNamespace = { fg = c.parameter },
    NeotestSkipped = { fg = c.warning },
    NeotestIndent = { fg = c.comment }, -- Indentation for tests
  }

  -- Allow user to add or override any highlight groups
  conf.on_highlights(highlights, conf.colors)
  set_vim_highlights(highlights)
end

return M

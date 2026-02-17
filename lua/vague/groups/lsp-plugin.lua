local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    DiagnosticError               = { fg = c.error, bold = conf.bold },                       -- diagnostic error
    DiagnosticHint                = { fg = c.hint },                                          -- diagnostic hint
    DiagnosticInfo                = { fg = c.constant, italic = conf.italic },                -- diagnostic info
    DiagnosticOk                  = { fg = c.plus },                                          -- diagnostic ok
    DiagnosticUnderlineError      = { sp = c.error   , undercurl = true },                    -- undercurl for errors
    DiagnosticUnderlineHint       = { sp = c.hint    , undercurl = true },                    -- undercurl for hints
    DiagnosticUnderlineInfo       = { sp = c.constant, undercurl = true },                    -- undercurl for info
    DiagnosticUnderlineOk         = { sp = c.plus    , undercurl = true },                    -- undercurl for ok
    DiagnosticUnderlineWarn       = { sp = c.delta   , undercurl = true, bold = conf.bold },  -- undercurl for warnings
    DiagnosticVirtualTextError    = { fg = c.error, bold = conf.bold },                       -- virtual text for errors
    DiagnosticVirtualTextHint     = { fg = c.hint },                                          -- virtual text for hints
    DiagnosticVirtualTextInfo     = { fg = c.constant, italic = conf.italic },                -- virtual text for info
    DiagnosticVirtualTextOk       = { fg = c.plus },                                          -- virtual text for ok
    DiagnosticVirtualTextWarn     = { fg = c.warning, bold = conf.bold },                     -- virtual text for warnings
    DiagnosticWarn                = { fg = c.warning, bold = conf.bold },                     -- diagnostic warning
    LspCodeLens                   = { fg = c.comment, gui = conf.style.comments },            -- code lens text
    LspCodeLensSeparator          = { fg = c.comment },                                       -- code lens separator
    LspCxxHlGroupEnumConstant     = { fg = c.type },                                          -- C++ enum constants
    LspCxxHlGroupMemberVariable   = { fg = c.type },                                          -- C++ member variables
    LspCxxHlGroupNamespace        = { fg = c.func },                                          -- C++ namespaces
    LspCxxHlSkippedRegion         = { fg = c.comment },                                       -- C++ skipped regions
    LspCxxHlSkippedRegionBeginEnd = { fg = c.operator },                                      -- C++ skipped region begin/end
    LspReferenceRead              = { bg = c.comment },                                       -- reference read
    LspReferenceText              = { bg = c.comment },                                       -- reference text
    LspReferenceWrite             = { bg = c.comment },                                       -- reference write
  }

  return hl
end
return M

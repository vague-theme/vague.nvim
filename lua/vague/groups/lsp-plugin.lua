local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    DiagnosticError               = { fg = c.error, bold = conf.bold },
    DiagnosticHint                = { fg = c.hint },
    DiagnosticInfo                = { fg = c.constant, italic = conf.italic },
    DiagnosticOk                  = { fg = c.plus },
    DiagnosticUnderlineError      = { sp = c.error   , undercurl = true },
    DiagnosticUnderlineHint       = { sp = c.hint    , undercurl = true },
    DiagnosticUnderlineInfo       = { sp = c.constant, undercurl = true },
    DiagnosticUnderlineOk         = { sp = c.plus    , undercurl = true },
    DiagnosticUnderlineWarn       = { sp = c.delta   , undercurl = true, bold = conf.bold },
    DiagnosticVirtualTextError    = { fg = c.error, bold = conf.bold },
    DiagnosticVirtualTextHint     = { fg = c.hint },
    DiagnosticVirtualTextInfo     = { fg = c.constant, italic = conf.italic },
    DiagnosticVirtualTextOk       = { fg = c.plus },
    DiagnosticVirtualTextWarn     = { fg = c.warning, bold = conf.bold },
    DiagnosticWarn                = { fg = c.warning, bold = conf.bold },
    LspCodeLens                   = { fg = c.comment, italic = conf.italic },
    LspCodeLensSeparator          = { fg = c.comment },
    LspCxxHlGroupEnumConstant     = { fg = c.type },
    LspCxxHlGroupMemberVariable   = { fg = c.type },
    LspCxxHlGroupNamespace        = { fg = c.func },
    LspCxxHlSkippedRegion         = { fg = c.comment },
    LspCxxHlSkippedRegionBeginEnd = { fg = c.operator },
    LspReferenceRead              = { bg = c.comment },
    LspReferenceText              = { bg = c.comment },
    LspReferenceWrite             = { bg = c.comment },
  }

  return hl
end
return M

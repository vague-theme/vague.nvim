local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    NeoTreeVertSplit          = { fg = c.comment, bg = not conf.transparent and c.comment or nil },
    NeoTreeWinSeparator       = { fg = c.comment, bg = not conf.transparent and c.comment or nil },
    NeoTreeRootName           = { fg = c.hint, bold = conf.bold },
    NeoTreeGitConflict        = { fg = c.error, bold = conf.bold, italic = conf.italic },
    NeoTreeGitUntracked       = { fg = c.error, italic = conf.italic },
    NeoTreeIndentMarker       = { fg = c.comment },
    NeoTreeSymbolicLinkTarget = { fg = c.hint },
  }

  return hl
end
return M

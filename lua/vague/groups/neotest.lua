local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    NeotestTest             = { fg = c.comment },
    NeotestDir              = { fg = c.comment },
    NeotestFile             = { fg = c.constant },
    NeotestPassed           = { fg = c.plus},
    NeotestFailed           = { fg = c.error },
    NeotestMarked           = { fg = c.delta },
    NeotestWatching         = { fg = c.warning },
    NeotestTarget           = { fg = c.hint },
    NeotestFocused          = { fg = c.delta, bold = conf.bold },
    NeotestRunning          = { fg = c.hint },
    NeotestAdapterName      = { fg = c.hint, bold = conf.bold },
    NeotestNamespace        = { fg = c.parameter },
    NeotestSkipped          = { fg = c.warning },
    NeotestIndent           = { fg = c.comment },
  }

  return hl
end
return M

local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
      ModesCopy    = { bg = c.keyword },
      ModesDelete  = { bg = c.error },
      ModesFormat  = { bg = c.func },
      ModesReplace = { bg = c.plus },
      ModesVisual  = { bg = c.number },
      ModesInsert  = { bg = c.constant },

      ModesInsertCursorLine     = { bg = c.line },
      ModesInsertCursorLineNr   = { bg = c.line },
      ModesInsertCursorLineFold = { bg = c.line },
      ModesInsertCursorLineSign = { bg = c.line },
  }

  return hl
end
return M

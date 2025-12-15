local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
      ModesDelete  = { bg = c.error },
      ModesInsert  = { bg = c.line },
      ModesVisual  = { bg = c.number },
      ModesReplace = { bg = c.plus },
  }

  return hl
end
return M

local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    TelescopeBorder           = { fg = c.floatBorder },
    TelescopeMatching         = { fg = c.delta, bold = conf.bold },
    TelescopeSelection        = { fg = c.constant, bg = c.line },
    TelescopeSelectionCaret   = { fg = c.constant },
  }

  return hl
end
return M

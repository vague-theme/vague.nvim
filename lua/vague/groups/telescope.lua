local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    TelescopeBorder           = { fg = c.floatBorder },
    TelescopeMatching         = { fg = c.delta, bold = conf.bold },
    TelescopePromptPrefix     = { fg = c.constant },
    TelescopeSelection        = { fg = c.constant, bg = c.line },
    TelescopeSelectionCaret   = { fg = c.constant },
    TelescopeResultsNormal    = { fg = c.fg },
  }

  return hl
end
return M

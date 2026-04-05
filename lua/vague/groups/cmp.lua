local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    CmpItemAbbrDeprecated = { fg = c.error, strikethrough = true },
    CmpItemAbbrMatch      = { fg = c.delta, bold = conf.bold },
    CmpItemAbbrMatchFuzzy = { fg = c.delta, bold = conf.bold },
    CmpItemKind           = { fg = c.comment },
  }

  return hl
end
return M

local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
      htmlTag            = { fg = c.fg },
      htmlEndTag         = { fg = c.fg },
      htmlTagName        = { fg = c.builtin },
      htmlArg            = { fg = c.constant },
      htmlSpecialTagName = { fg = c.builtin },
  }

  return hl
end
return M

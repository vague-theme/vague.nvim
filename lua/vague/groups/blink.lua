local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    BlinkCmpDocBorder            = { fg = c.floatBorder },
    BlinkCmpLabelDeprecated      = { link = "CmpItemAbbrDeprecated" },
    BlinkCmpMenuBorder           = { fg = c.floatBorder },
    BlinkCmpSignatureHelpBorder  = { fg = c.floatBorder },
  }

  return hl
end
return M

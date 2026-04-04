local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    BlinkCmpDocBorder            = { fg = c.floatBorder },
    BlinkCmpGhostText            = { link = "CmpGhostText" },
    BlinkCmpLabel                = { link = "CmpItemAbbr" },
    BlinkCmpLabelDeprecated      = { link = "CmpItemAbbrDeprecated" },
    BlinkCmpLabelMatch           = { link = "CmpItemAbbrMatch" },
    BlinkCmpMenu                 = { link = "CmpItemMenu" },
    BlinkCmpMenuBorder           = { fg = c.floatBorder },
    BlinkCmpKind                 = { link = "CmpKind" },
    BlinkCmpSignatureHelpBorder  = { fg = c.floatBorder },
  }

  return hl
end
return M

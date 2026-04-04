local cmp_group = require("vague.groups.cmp")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local cmp = cmp_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    BlinkCmpDocBorder            = { fg = c.floatBorder },
    BlinkCmpGhostText            = cmp["CmpGhostText"],
    BlinkCmpLabel                = cmp["CmpItemAbbr"],
    BlinkCmpLabelDeprecated      = cmp["CmpItemAbbrDeprecated"],
    BlinkCmpLabelMatch           = cmp["CmpItemAbbrMatch"],
    BlinkCmpMenu                 = cmp["CmpItemMenu"],
    BlinkCmpMenuBorder           = { fg = c.floatBorder },
    BlinkCmpKind                 = cmp["CmpKind"],
    BlinkCmpSignatureHelpBorder  = { fg = c.floatBorder },
  }

  return hl
end
return M

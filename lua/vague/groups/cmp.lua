local common_group = require("vague.groups.common")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local common = common_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    CmpGhostText          = { fg = c.comment },
    CmpItemAbbr           = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.error, strikethrough = true },
    CmpItemAbbrMatch      = { fg = c.delta, bold = conf.bold },
    CmpItemAbbrMatchFuzzy = { fg = c.delta, bold = conf.bold },
    CmpItemMenu           = common["Pmenu"],
    CmpItemKind           = { fg = c.comment },
  }

  return hl
end
return M

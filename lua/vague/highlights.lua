local curr_internal_conf = require("vague.config.internal").current
local groups = require("vague.groups")
local M = {}

M.set_highlights = function()
  local highlights = {}
  for _, group in pairs(groups) do
    for hl, settings in pairs(group) do
      highlights[hl] = settings
    end
  end

  -- Allow user to add or override any highlight groups
  curr_internal_conf.on_highlights(highlights, curr_internal_conf.colors)

  for hl, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, settings)
  end
end

return M

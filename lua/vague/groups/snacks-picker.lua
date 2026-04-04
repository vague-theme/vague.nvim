local telescope_group = require("vague.groups.telescope")
local neotree_group = require("vague.groups.neotree")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local telescope = telescope_group.get_colors(conf)
  local neotree = neotree_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    SnacksPickerMatch              = telescope["TelescopeMatching"],
    SnacksPickerPrompt             = telescope["TelescopePromptPrefix"],
    SnacksPickerBorder             = telescope["TelescopeBorder"],
    SnacksPickerBoxBorder          = telescope["TelescopeBorder"],
    SnacksPickerListBorder         = telescope["TelescopeBorder"],
    SnacksPickerInputBorder        = telescope["TelescopeBorder"],
    SnacksPickerPrewviewBorder     = telescope["TelescopeBorder"],
    SnacksPickerCursorLine         = telescope["TelescopeSelection"],
    SnacksPickerBoxCursorLine      = telescope["TelescopeSelection"],
    SnacksPickerListCursorLine     = telescope["TelescopeSelection"],
    SnacksPickerInputCursorLine    = telescope["TelescopeSelection"],
    SnacksPickerPreviewCursorLine  = telescope["TelescopeSelection"],
    SnacksPickerGitStatusUntracked = neotree["NeoTreeGitUntracked"],
    SnacksPickerGitStatusAdded     = neotree["NeoTreeGitAdded"],
    SnacksPickerGitStatusModified  = neotree["NeoTreeGitModified"],
    SnacksPickerGitStatusStaged    = neotree["NeoTreeGitAdded"],
  }

  return hl
end
return M

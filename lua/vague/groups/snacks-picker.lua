local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  -- stylua: ignore
  local hl = {
    SnacksPickerMatch              = { link = "TelescopeMatching" },
    SnacksPickerPrompt             = { link = "TelescopePromptPrefix" },
    SnacksPickerBorder             = { link = "TelescopeBorder" },
    SnacksPickerBoxBorder          = { link = "TelescopeBorder" },
    SnacksPickerListBorder         = { link = "TelescopeBorder" },
    SnacksPickerInputBorder        = { link = "TelescopeBorder" },
    SnacksPickerPrewviewBorder     = { link = "TelescopeBorder" },
    SnacksPickerCursorLine         = { link = "TelescopeSelection" },
    SnacksPickerBoxCursorLine      = { link = "TelescopeSelection" },
    SnacksPickerListCursorLine     = { link = "TelescopeSelection" },
    SnacksPickerInputCursorLine    = { link = "TelescopeSelection" },
    SnacksPickerPreviewCursorLine  = { link = "TelescopeSelection" },
    SnacksPickerGitStatusUntracked = { link = "NeoTreeGitUntracked" },
    SnacksPickerGitStatusAdded     = { link = "NeoTreeGitAdded" },
    SnacksPickerGitStatusModified  = { link = "NeoTreeGitModified" },
    SnacksPickerGitStatusStaged    = { link = "NeoTreeGitAdded" },
  }

  return hl
end
return M

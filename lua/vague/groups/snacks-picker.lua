local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  -- stylua: ignore
  local hl = {
    SnacksPickerMatch              = { link = "TelescopeMatching" },
    SnacksPickerPrompt             = { link = "TelescopePromptPrefix" },
    SnacksPickerCursorLine         = { link = "TelescopeSelection" },
    SnacksPickerListCursorLine     = { link = "TelescopeSelection" },
    SnacksPickerPreviewCursorLine  = { link = "TelescopeSelection" },
    SnacksPickerGitStatusUntracked = { link = "NeoTreeGitUntracked" },
    SnacksPickerGitStatusModified  = { link = "NeoTreeGitModified" },
    SnacksPickerGitStatusStaged    = { link = "NeoTreeGitAdded" },
  }

  return hl
end
return M

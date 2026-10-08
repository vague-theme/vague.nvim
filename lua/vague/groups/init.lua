local M = {}

local group_modules = {
  "blink",
  "cmp",
  "common",
  "dashboard",
  "diff",
  "fzf-lua",
  "html",
  "lsp-native",
  "lsp-plugin",
  "mini",
  "modes",
  "neotest",
  "neotree",
  "rainbow-delimiters",
  "snacks-input",
  "snacks-picker",
  "syntax",
  "telescope",
  "treesitter",
  "vim-better-whitespace",
}

--- Resolves every group module against the given config. Called at highlight time,
--- not at require time, so a 'background' switch picks up the right palette.
---@param conf VagueColorscheme.InternalConfig
---@return table<string, table<string, vim.api.keyset.highlight>>
M.get = function(conf)
  local groups = {}
  for _, module in ipairs(group_modules) do
    groups[module] = require("vague.groups." .. module).get_colors(conf)
  end
  return groups
end

return M

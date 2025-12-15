local curr_internal_conf = require("vague.config.internal").current

---@param group string
local function init(group) return require("vague.groups." .. group).get_colors(curr_internal_conf) end

return {
  blink = init("blink"),
  cmp = init("cmp"),
  common = init("common"),
  dashboard = init("dashboard"),
  diff = init("diff"),
  fzf_lua = init("fzf-lua"),
  lsp_native = init("lsp-native"),
  lsp_plugin = init("lsp-plugin"),
  mini = init("mini"),
  modes = init("modes"),
  neotest = init("neotest"),
  neotree = init("neotree"),
  netrw = init("netrw"),
  rainbow_delimiters = init("rainbow-delimiters"),
  snacks_indent = init("snacks-indent"),
  snacks_input = init("snacks-input"),
  snacks_picker = init("snacks-picker"),
  syntax = init("syntax"),
  telescope = init("telescope"),
  treesitter = init("treesitter"),
  treesitter_context = init("treesitter-context"),
  vim_better_whitespace = init("vim-better-whitespace"),
}

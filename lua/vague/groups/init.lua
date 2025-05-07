local curr_internal_conf = require("vague.config.internal").current
return {
  common = require("vague.groups.common").get_colors(curr_internal_conf),
  cmp = require("vague.groups.cmp").get_colors(curr_internal_conf),
  blink = require("vague.groups.blink").get_colors(curr_internal_conf),
  lsp_native = require("vague.groups.lsp-native").get_colors(curr_internal_conf),
  lsp_plugin = require("vague.groups.lsp-plugin").get_colors(curr_internal_conf),
  gitsigns = require("vague.groups.gitsigns").get_colors(curr_internal_conf),
  neotest = require("vague.groups.neotest").get_colors(curr_internal_conf),
  mini = require("vague.groups.mini").get_colors(curr_internal_conf),
  neotree = require("vague.groups.neotree").get_colors(curr_internal_conf),
  syntax = require("vague.groups.syntax").get_colors(curr_internal_conf),
  telescope = require("vague.groups.telescope").get_colors(curr_internal_conf),
  treesitter = require("vague.groups.treesitter").get_colors(curr_internal_conf),
  dashboard = require("vague.groups.dashboard").get_colors(curr_internal_conf),
  snacks_picker = require("vague.groups.snacks-picker").get_colors(curr_internal_conf),
  snacks_input = require("vague.groups.snacks-input").get_colors(curr_internal_conf),
  rainbow_delimiters = require("vague.groups.rainbow-delimiters").get_colors(curr_internal_conf),
}

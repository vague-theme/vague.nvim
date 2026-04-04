local syntax_group = require("vague.groups.syntax")
local ts_group = require("vague.groups.treesitter")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local syntax = syntax_group.get_colors(conf)
  local treesitter = ts_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    ["@lsp.type.builtinConstant"]            = treesitter["@constant.builtin"],
    ["@lsp.type.builtinType"]                = treesitter["@type.builtin"],
    ["@lsp.type.class"]                      = syntax["Structure"],
    ["@lsp.type.comment"]                    = syntax["Comment"],
    ["@lsp.type.enum"]                       = syntax["Structure"],
    ["@lsp.type.enumMember"]                 = treesitter["@variable.member"],
    ["@lsp.type.function"]                   = treesitter["@function.call"],
    ["@lsp.type.generic"]                    = treesitter["@type"],
    ["@lsp.type.interface"]                  = syntax["Structure"],
    ["@lsp.type.macro"]                      = syntax["Macro"],
    ["@lsp.type.method"]                     = treesitter["@function.method"],
    ["@lsp.type.namespace"]                  = treesitter["@module"],
    ["@lsp.type.parameter"]                  = treesitter["@variable.parameter"],
    ["@lsp.type.property"]                   = treesitter["@type"],
    ["@lsp.type.selfParameter"]              = syntax["Special"],
    ["@lsp.type.typeParameter"]              = syntax["Typedef"],
    ["@lsp.type.variable"]                   = treesitter["@constant"],
    ["@lsp.typemod.function.builtin"]        = treesitter["@function.builtin"],
    ["@lsp.typemod.function.defaultLibrary"] = treesitter["@function.builtin"],
    ["@lsp.typemod.function.definition"]     = treesitter["@function"],
    ["@lsp.typemod.variable.defaultLibrary"] = treesitter["@constant.builtin"],
    ["@lsp.typemod.variable.definition"]     = treesitter["@property"],
  }

  return hl
end
return M

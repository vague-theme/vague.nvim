local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  -- stylua: ignore
  local hl = {
    ["@lsp.type.builtinConstant"]            = { link = "@constant.builtin" },
    ["@lsp.type.builtinType"]                = { link = "@type.builtin" },
    ["@lsp.type.class"]                      = { link = "Structure" },
    ["@lsp.type.comment"]                    = { link = "Comment" },
    ["@lsp.type.enum"]                       = { link = "Structure" },
    ["@lsp.type.enumMember"]                 = { link = "@variable.member" },
    ["@lsp.type.function"]                   = { link = "@function.call" },
    ["@lsp.type.generic"]                    = { link = "@type" },
    ["@lsp.type.interface"]                  = { link = "Structure" },
    ["@lsp.type.macro"]                      = { link = "Macro" },
    ["@lsp.type.method"]                     = { link = "@function.method" },
    ["@lsp.type.namespace"]                  = { link = "@module" },
    ["@lsp.type.parameter"]                  = { link = "@variable.parameter" },
    ["@lsp.type.property"]                   = { link = "@type" },
    ["@lsp.type.selfParameter"]              = { link = "Special" },
    ["@lsp.type.typeParameter"]              = { link = "Typedef" },
    ["@lsp.type.variable"]                   = { link = "@constant" },
    ["@lsp.typemod.function.builtin"]        = { link = "@function.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.function.definition"]     = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.variable.definition"]     = { link = "@property" },
  }

  return hl
end
return M

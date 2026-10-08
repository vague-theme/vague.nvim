local M = {}

---@class VagueColorscheme.InternalConfig
---@field background? "dark"|"light" Overrides the palette chosen from |'background'| when set.
local DEFAULT_SETTINGS = {

  ---@type string
  background = "dark",
  ---@type boolean
  transparent = false,
  ---@type boolean
  bold = true,
  ---@type boolean
  italic = true,

  ---@param highlights table<string, vim.api.keyset.highlight>
  ---@param colors VagueColorscheme.InternalConfig.colors
  on_highlights = function(highlights, colors) end,

  ---@class VagueColorscheme.InternalConfig.colors
  colors = {
    ---@type string
    bg = "#141415",
    ---@type string
    inactiveBg = "#1c1c24",
    ---@type string
    fg = "#cdcdcd",
    ---@type string
    floatBorder = "#878787",
    ---@type string
    line = "#252530",
    ---@type string
    comment = "#606079",
    ---@type string
    builtin = "#b4d4cf",
    ---@type string
    func = "#c48282",
    ---@type string
    string = "#e8b589",
    ---@type string
    number = "#e0a363",
    ---@type string
    property = "#c3c3d5",
    ---@type string
    constant = "#aeaed1",
    ---@type string
    parameter = "#bb9dbd",
    ---@type string
    visual = "#333738",
    ---@type string
    error = "#d8647e",
    ---@type string
    warning = "#f3be7c",
    ---@type string
    hint = "#7e98e8",
    ---@type string
    operator = "#90a0b5",
    ---@type string
    keyword = "#6e94b2",
    ---@type string
    type = "#9bb4bc",
    ---@type string
    search = "#405065",
    ---@type string
    plus = "#7fa563",
    ---@type string
    delta = "#f3be7c",
    ---@type string
    diffAdd = "#293125",
    ---@type string
    diffChange = "#41362a",
    ---@type string
    diffDelete = "#3b242a",
    ---@type string
    diffText = "#6d583e",
  },

  ---@class VagueColorscheme.InternalConfig.light_colors
  light_colors = {
    ---@type string
    bg = "#f5f5f8",
    ---@type string
    inactiveBg = "#ececf1",
    ---@type string
    fg = "#34343c",
    ---@type string
    floatBorder = "#8e8e9c",
    ---@type string
    line = "#d6d6e1",
    ---@type string
    comment = "#82828f",
    ---@type string
    builtin = "#346961",
    ---@type string
    func = "#bc4e4e",
    ---@type string
    string = "#905624",
    ---@type string
    number = "#925d25",
    ---@type string
    property = "#5e5e93",
    ---@type string
    constant = "#5d5db0",
    ---@type string
    parameter = "#8c5890",
    ---@type string
    visual = "#c8c8d5",
    ---@type string
    error = "#cf4161",
    ---@type string
    warning = "#845821",
    ---@type string
    hint = "#4567d0",
    ---@type string
    operator = "#556e8e",
    ---@type string
    keyword = "#47789f",
    ---@type string
    type = "#496d78",
    ---@type string
    search = "#c8d4ec",
    ---@type string
    plus = "#567a3d",
    ---@type string
    delta = "#845821",
    ---@type string
    diffAdd = "#cbefb3",
    ---@type string
    diffChange = "#f0d3b2",
    ---@type string
    diffDelete = "#efb9c5",
    ---@type string
    diffText = "#e6b06f",
  },
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

local opts = type(vim.g.vague_colorscheme) == "function" and vim.g.vague_colorscheme() or vim.g.vague_colorscheme or {}

---@param user_opts VagueColorscheme.Config
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts or opts) end

--- Returns a shallow copy of the current config with `colors` pointing at the palette
--- matching the `background` option, or |'background'| when it isn't set. Nvim reloads
--- the colorscheme when 'background' changes, so this always reflects the active variant.
---@return VagueColorscheme.InternalConfig
M.get = function()
  local conf = vim.tbl_extend("force", {}, M.current)
  if (conf.background or vim.o.background) == "light" then conf.colors = M.current.light_colors end
  return conf
end

return M

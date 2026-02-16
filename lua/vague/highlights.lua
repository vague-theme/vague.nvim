local curr_internal_conf = require("vague.config.internal").current
local groups = require("vague.groups")
local M = {}

---@param highlights table<string, table>
local function set_vim_highlights(highlights)
  for name, setting in pairs(highlights) do
    local style_string = setting.gui or setting.fmt or ""
    -- Clear not supported in nvim_set_hl() options
    setting.gui = nil
    setting.fmt = nil

    style_string = style_string:gsub("none", "")

    -- Parse strings like "bold,italic"
    local parsed = {}
    for style in style_string:gmatch("([^,]+)") do
      parsed[style] = true
    end

    parsed.bold = curr_internal_conf.bold and parsed.bold
    parsed.italic = curr_internal_conf.italic and parsed.italic

    local hl_opts = vim.tbl_extend("force", setting, parsed)
    vim.api.nvim_set_hl(0, name, hl_opts)
  end
end

M.set_highlights = function()
  local highlights = {}
  for _, group in pairs(groups) do
    for hl, settings in pairs(group) do
      highlights[hl] = settings
    end
  end

  -- Allow user to add or override any highlight groups
  curr_internal_conf.on_highlights(highlights, curr_internal_conf.colors)
  set_vim_highlights(highlights)
end

return M

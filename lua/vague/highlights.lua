local curr_internal_conf = require("vague.config.internal").current
local groups = require("vague.groups")
local M = {}

---@param highlights table <string, table>
local function set_vim_highlights(highlights)
  for name, setting in pairs(highlights) do
    if setting.gui == "bold" and not curr_internal_conf.bold then
      setting.gui = "none"
    elseif setting.gui == "italic" and not curr_internal_conf.italic then
      setting.gui = "none"
    end

    vim.api.nvim_set_hl(0, name, {
      fg = setting.fg,
      bg = setting.bg,
      sp = setting.sp,
      bold = setting.gui == "bold",
      italic = setting.gui == "italic",
      standout = setting.gui == "standout",
      underline = setting.gui == "underline",
      undercurl = setting.gui == "undercurl",
      underdouble = setting.gui == "underdouble",
      underdotted = setting.gui == "underdotted",
      underdashed = setting.gui == "underdashed",
      strikethrough = setting.gui == "strikethrough",
      reverse = setting.gui == "reverse",
      nocombine = setting.gui == "nocombine",
    })
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

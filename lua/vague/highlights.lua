local curr_internal_conf = require("vague.config.internal").current
local groups = require("vague.groups")
local M = {}

---@param highlights table<string, table>
local function set_vim_highlights(highlights)
  for name, setting in pairs(highlights) do
    local style_string = setting.gui or setting.fmt or ""

    if not curr_internal_conf.bold then style_string = style_string:gsub("bold", "") end
    if not curr_internal_conf.italic then style_string = style_string:gsub("italic", "") end

    local parsed = {}
    -- we do this to avoid strings like ",italic" from being inserted
    for style in style_string:gmatch("([^,]+)") do
      parsed[style] = true
    end

    vim.api.nvim_set_hl(0, name, {
      fg = setting.fg,
      bg = setting.bg,
      sp = setting.sp,
      -- options will be nil if not defined somewhere so always default to false
      bold = parsed.bold or false,
      italic = parsed.italic or false,
      standout = parsed.standout or false,
      underline = parsed.underline or false,
      undercurl = parsed.undercurl or false,
      underdouble = parsed.underdouble or false,
      underdotted = parsed.underdotted or false,
      underdashed = parsed.underdashed or false,
      strikethrough = parsed.strikethrough or setting.strikethrough or false,
      reverse = parsed.reverse or false,
      nocombine = parsed.nocombine or false,
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

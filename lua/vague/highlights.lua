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
      bold = parsed.bold,
      italic = parsed.italic,
      standout = parsed.standout,
      underline = parsed.underline,
      undercurl = parsed.undercurl,
      underdouble = parsed.underdouble,
      underdotted = parsed.underdotted,
      underdashed = parsed.underdashed,
      strikethrough = parsed.strikethrough or setting.strikethrough,
      reverse = parsed.reverse,
      nocombine = parsed.nocombine,
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

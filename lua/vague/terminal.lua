local internal_conf = require("vague.config.internal")
local M = {}

-- Bright half of the ANSI palette (colors 9-15). Dark values come from the shared
-- palette; light values are derived from the light accents. Replace both with a
-- palette lookup once the upstream palette defines ANSI colors per variant.
local BRIGHT_COLORS = {
  dark = { "#e08398", "#99b782", "#f5cb96", "#8ba9c1", "#c9b1ca", "#bebeda", "#d7d7d7" },
  light = { "#be294b", "#42622c", "#664316", "#366388", "#77447b", "#45459f", "#e0e0e7" },
}

M.set_highlights = function()
  local c = internal_conf.get().colors
  local is_light = vim.o.background == "light"

  vim.g.terminal_color_0 = is_light and c.fg or c.line -- black
  vim.g.terminal_color_1 = c.error -- red
  vim.g.terminal_color_2 = c.plus -- green
  vim.g.terminal_color_3 = c.warning -- yellow
  vim.g.terminal_color_4 = c.keyword -- blue
  vim.g.terminal_color_5 = c.parameter -- purple
  vim.g.terminal_color_6 = c.constant -- cyan
  vim.g.terminal_color_7 = is_light and c.visual or c.fg -- white
  vim.g.terminal_color_8 = c.comment -- gray

  local bright = BRIGHT_COLORS[is_light and "light" or "dark"]
  for i, color in ipairs(bright) do
    vim.g["terminal_color_" .. (i + 8)] = color
  end
end

return M

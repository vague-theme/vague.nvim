local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    MiniDiffOverContext = { bg = c.line },
    MiniDiffSignAdd     = { fg = c.plus },
    MiniDiffSignChange  = { fg = c.delta },
    MiniDiffSignDelete  = { fg = c.error },

    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.operator, bold = conf.bold },
    MiniStatuslineModeInsert  = { fg = c.bg, bg = c.delta, bold = conf.bold },
    MiniStatuslineModeVisual  = { fg = c.bg, bg = c.builtin, bold = conf.bold },
    MiniStatuslineModeReplace = { fg = c.bg, bg = c.string, bold = conf.bold },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.string, bold = conf.bold },
    MiniStatuslineModeOther   = { fg = c.bg, bg = c.string, bold = conf.bold },
    MiniStatuslineDevinfo     = { fg = c.fg, bg = c.inactiveBg },
    MiniStatuslineFilename    = { fg = c.comment, bg = c.bg },
    MiniStatuslineFileinfo    = { fg = c.fg, bg = c.inactiveBg },
    MiniStatuslineInactive    = { fg = c.comment, bg = c.bg },
  }

  return hl
end
return M

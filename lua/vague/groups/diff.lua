local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    Added         = { fg = c.plus },
    Changed       = { fg = c.delta },
    Removed       = { fg = c.error },
    DiffAdd       = { bg = "#293125" },
    DiffChange    = { bg = "#41362a" },
    DiffDelete    = { bg = "#3b242a" },
    DiffText      = { bg = "#6D583E" },
    DiffFile      = { fg = c.keyword },
    DiffIndexLine = { fg = c.comment },
  }

  return hl
end
return M

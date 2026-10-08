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
    DiffAdd       = { bg = c.diffAdd },
    DiffChange    = { bg = c.diffChange },
    DiffDelete    = { bg = c.diffDelete },
    DiffText      = { bg = c.diffText },
    DiffFile      = { fg = c.keyword },
    DiffIndexLine = { fg = c.comment },
  }

  return hl
end
return M

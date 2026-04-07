<div align="center">
  <img height="80" alt="icon" src="https://github.com/vague-theme/vague/blob/main/assets/icon.png?raw=true" />
  <h1>Vague for Neovim</h1>
  <img alt="Preview" src="https://github.com/user-attachments/assets/8145d76e-3040-4bee-b6bf-3c65140f4786" />
</div>

## Installation

```lua
vim.pack.add({ 'https://github.com/vague-theme/vague.nvim' })
vim.cmd.colorscheme('vague')
```

## Configuration

Calling `setup()` is optional.

```lua
require('vague').setup({
  transparent = false, -- If true, background is not set
  bold = true, -- Disable bold globally
  italic = true, -- Disable italic globally
  on_highlights = function(hl, colors) end,
  colors = {
    bg = '#141415',
    inactiveBg = '#1c1c24',
    fg = '#cdcdcd',
    floatBorder = '#878787',
    line = '#252530',
    comment = '#606079',
    builtin = '#b4d4cf',
    func = '#c48282',
    string = '#e8b589',
    number = '#e0a363',
    property = '#c3c3d5',
    constant = '#aeaed1',
    parameter = '#bb9dbd',
    visual = '#333738',
    error = '#d8647e',
    warning = '#f3be7c',
    hint = '#7e98e8',
    operator = '#90a0b5',
    keyword = '#6e94b2',
    type = '#9bb4bc',
    search = '#405065',
    plus = '#7fa563',
    delta = '#f3be7c',
  },
})
```

## Overriding highlights

You can modify or extend highlight groups using the `on_highlights` callback. The first argument is a table of all current highlight definitions that can be directly modified. The second argument provides table of theme colors.

```lua
on_highlights = function(hl, colors)
  -- Replace an entire highlight group.
  -- See `:h nvim_set_hl()` for available options.
  hl.NewHighlight = { fg = colors.fg, bg = colors.bg, bold = true }

  -- Change only the foreground color of an existing group.
  hl.ExistingHighlight.fg = colors.delta
end
```

## Extras

Extra color configs for other tools can be found in [GitHub organization](https://github.com/vague-theme).

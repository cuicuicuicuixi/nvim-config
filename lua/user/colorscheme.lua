vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_transparent_sidebar = false
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_dark_sidebar = true

vim.cmd [[
try
  colorscheme tokyonight
  " set background=dark
  " highlight Normal guibg=NONE ctermbg=None
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  --set background=dark
endtry
]]

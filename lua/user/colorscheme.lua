vim.cmd [[
try
  colorscheme kanagawa
  " set background=dark
  " highlight Normal guibg=NONE ctermbg=None
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  --set background=dark
endtry
]]

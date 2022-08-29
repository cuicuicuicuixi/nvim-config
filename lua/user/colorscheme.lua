vim.cmd [[
try
  colorscheme synthwave84
  " set background=dark
  " highlight Normal guibg=NONE ctermbg=None
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  --set background=dark
endtry
]]

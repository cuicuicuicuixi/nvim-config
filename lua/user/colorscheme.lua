vim.cmd [[
try
  colorscheme codemonkey
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme codemonkey
  --set background=dark
endtry
]]

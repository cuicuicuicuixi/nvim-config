local status_ok, indentline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

-- vim.cmd[[highlight IndentBlanklineContextChar guifg=#56B6C2 gui=nocombine]]

vim.opt.list = true

indentline.setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true
}

local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
    return
end

neogen.setup{
    enabled = true,
    languages = {
        cpp = {
            template = {
                annotation_convention = "doxygen"
            }
        },
        c = {
            template = {
                annotation_convention = "doxygen"
            }
        },
        lua = {
            template = {
                annotation_convention = "emmylua"
            }
        }
    }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>ng", ":Neogen<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nff", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)

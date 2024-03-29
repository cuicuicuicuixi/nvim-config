local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

-- vim.cmd([[
-- set shell=pwsh
-- set shellcmdflag=-command
-- set shellquote=\"
-- set shellxquote=
-- ]])

toggleterm.setup({
    size = 10,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    -- direction = "horizontal",
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<m-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<m-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<m-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<m-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(_)
        vim.cmd("startinsert!")
        --vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(_)
      -- vim.cmd("Closing terminal")
    end,
    count = 99,
})

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
    node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
    ncdu:toggle()
end

local btop = Terminal:new({ cmd = "btop", hidden = true })

function _BTOP_TOGGLE()
    btop:toggle()
end

-- vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua _HTOP_TOGGLE()<CR>", {noremap = true, silent = true})

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end

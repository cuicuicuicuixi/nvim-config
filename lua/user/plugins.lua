local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "lazy")
if not status_ok then
	return
end


-- Install your plugins here
return packer.setup({
	-- My plugins here
	"wbthomason/packer.nvim", -- Have packer manage itself
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"christianchiarulli/lua-dev.nvim",

	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"akinsho/bufferline.nvim",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",

	-- Color
	"norcalli/nvim-colorizer.lua",
	"sunjon/shade.nvim",

	-- Colorschemes
	--[[ "lunarvim/colorschemes", -- A bunch of colorschemes you can try out ]]
	"lunarvim/darkplus.nvim",
	"lunarvim/onedarker.nvim",
	"EdenEast/nightfox.nvim",
	"folke/tokyonight.nvim",
	"lunarvim/synthwave84.nvim",
	"rebelot/kanagawa.nvim",
    'sainnhe/gruvbox-material',
    'ellisonleao/gruvbox.nvim',
    {'projekt0n/github-nvim-theme', version="v0.0.7"},
	--[[ "Mofiqul/dracula.nvim", ]]

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline",
    -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	--[[ "williamboman/nvim-lsp-installer", -- simple to use language server nvim-lsp-installer ]]
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"ray-x/lsp_signature.nvim",
	"lvimuser/lsp-inlayhints.nvim",
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	"RRethy/vim-illuminate",

	-- Telescope
	"nvim-telescope/telescope.nvim",
	--[[ "nvim-telescope/telescope-media-files.nvim", ]]

	-- Syntax/Treesitter
	"nvim-treesitter/nvim-treesitter",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"nvim-treesitter/playground",
	"p00f/nvim-ts-rainbow",
	--[[ "kylechui/nvim-surround", ]]

	-- Comment
	"numToStr/Comment.nvim", -- Easily comment stuff
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	"folke/lsp-colors.nvim",
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},

	-- Session
	"rmagatti/auto-session",
	"rmagatti/session-lens",

	-- Git
	"lewis6991/gitsigns.nvim",

	-- Tagbar
	"preservim/tagbar",
	"nanozuki/tabby.nvim",

	-- Winbar, Statusline
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},

	-- DashBoard
	"glepnir/dashboard-nvim",

	-- Indent-blankline
	"lukas-reineke/indent-blankline.nvim",

	-- Markdown
	-- use {
	--   "ellisonleao/glow.nvim",
	--   branch = 'main'
	-- }

    "iamcco/markdown-preview.nvim",

	-- Utility
	"stevearc/dressing.nvim", -- 匹配 neovim API
    "MunifTanjim/nui.nvim",
    --[[ use({
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }) ]]
	"rcarriga/nvim-notify",
	"lewis6991/impatient.nvim", -- 加速 neovim 加载 lua 模块
	"ghillb/cybu.nvim", -- 切换缓冲区
	"moll/vim-bbye", -- 关闭缓冲区但不关闭窗口

	-- Debug
	-- "ravenxrz/DAPInstall.nvim"
	-- 'mfussenegger/nvim-dap'
	-- "rcarriga/nvim-dap-ui"

	-- Motion
	"phaazon/hop.nvim",

	-- Editing Support
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",
	"junegunn/vim-slash",
	"andymass/vim-matchup",
	-- 'karb94/neoscroll.nvim'
	{
		"filipdutescu/renamer.nvim",
		branch = "master",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	-- Quick Fix
	"kevinhwang91/nvim-bqf",

	-- Project
	"ahmedkhalf/project.nvim",
	"windwp/nvim-spectre",

	-- Code Runner
	"is0n/jaq-nvim",

	-- Keybinding
	"folke/which-key.nvim",

	-- Note Taking
	"mickael-menu/zk-nvim",

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
})

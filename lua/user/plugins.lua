local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("christianchiarulli/lua-dev.nvim")

	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")

	-- Color
	use("norcalli/nvim-colorizer.lua")
	use("sunjon/shade.nvim")

	-- Colorschemes
	--[[ use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out ]]
	use("lunarvim/darkplus.nvim")
	use("lunarvim/onedarker.nvim")
	use("EdenEast/nightfox.nvim")
	use("folke/tokyonight.nvim")
	use("lunarvim/synthwave84.nvim")
	use("rebelot/kanagawa.nvim")
    use 'sainnhe/gruvbox-material'
	--[[ use("Mofiqul/dracula.nvim") ]]

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	--[[ use("williamboman/nvim-lsp-installer") -- simple to use language server nvim-lsp-installer ]]
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("ray-x/lsp_signature.nvim")
	use("lvimuser/lsp-inlayhints.nvim")
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("RRethy/vim-illuminate")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	--[[ use("nvim-telescope/telescope-media-files.nvim") ]]

	-- Syntax/Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/playground")
	use("p00f/nvim-ts-rainbow")
	--[[ use("kylechui/nvim-surround") ]]

	-- Comment
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use({
		"danymat/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use("folke/lsp-colors.nvim")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Session
	use("rmagatti/auto-session")
	use("rmagatti/session-lens")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Tagbar
	use("preservim/tagbar")
	use("nanozuki/tabby.nvim")

	-- Winbar, Statusline
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})

	-- DashBoard
	use("glepnir/dashboard-nvim")

	-- Indent-blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- Markdown
	-- use {
	--   "ellisonleao/glow.nvim",
	--   branch = 'main'
	-- }

	use({
		"iamcco/markdown-preview.nvim",
	})

	-- Utility
	use("stevearc/dressing.nvim") -- 匹配 neovim API
    use("MunifTanjim/nui.nvim")
    --[[ use({
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }) ]]
	use("rcarriga/nvim-notify")
	use("lewis6991/impatient.nvim") -- 加速 neovim 加载 lua 模块
	use("ghillb/cybu.nvim") -- 切换缓冲区
	use("moll/vim-bbye") -- 关闭缓冲区但不关闭窗口

	-- Debug
	-- use "ravenxrz/DAPInstall.nvim"
	-- use 'mfussenegger/nvim-dap'
	-- use "rcarriga/nvim-dap-ui"

	-- Motion
	use("phaazon/hop.nvim")

	-- Editing Support
	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")
	use("junegunn/vim-slash")
	use("andymass/vim-matchup")
	-- use 'karb94/neoscroll.nvim'
	use({
		"filipdutescu/renamer.nvim",
		branch = "master",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Quick Fix
	use({ "kevinhwang91/nvim-bqf" })

	-- Project
	use("ahmedkhalf/project.nvim")
	use("windwp/nvim-spectre")

	-- Code Runner
	use("is0n/jaq-nvim")

	-- Keybinding
	use("folke/which-key.nvim")

	-- Note Taking
	use("mickael-menu/zk-nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

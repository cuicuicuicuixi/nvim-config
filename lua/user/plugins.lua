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
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim", lazy = true }, -- Useful lua functions used ny lots of plugins
	"christianchiarulli/lua-dev.nvim",

	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	"kyazdani42/nvim-tree.lua",
	"akinsho/bufferline.nvim",
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("user.lualine").setup()
		end,
	},
	"akinsho/toggleterm.nvim",

	-- Color
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("user.colorizer")
		end,
	},
	--[[ { ]]
	--[[ 	"sunjon/shade.nvim", ]]
	--[[ 	event = { "BufReadPre", "BufNewFile" }, ]]
	--[[ 	config = function() ]]
	--[[ 		require("user.shade") ]]
	--[[ 	end, ]]
	--[[ }, ]]

	-- Colorschemes
	--[[ "lunarvim/colorschemes", -- A bunch of colorschemes you can try out ]]
	{ "lunarvim/darkplus.nvim", lazy = true },
	{ "lunarvim/onedarker.nvim", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			require("user.colorscheme")
		end,
	},
	{
		"lunarvim/synthwave84.nvim",
		lazy = true,
	},
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{
		"projekt0n/github-nvim-theme",
		version = "v0.0.7",
		lazy = true,
	},
	--[[ "Mofiqul/dracula.nvim", ]]

	-- cmp plugins
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
		},
		config = function()
			require("cmp")
		end,
	},
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
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	"williamboman/mason-lspconfig.nvim",
	"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"ray-x/lsp_signature.nvim",
	"lvimuser/lsp-inlayhints.nvim",
	--[[ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", ]]
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	"RRethy/vim-illuminate",

	-- Telescope
	"nvim-telescope/telescope.nvim",
	--[[ "nvim-telescope/telescope-media-files.nvim", ]]

	-- Syntax/Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("user.treesitter")
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
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
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("user.dashboard")
		end,
	},

	-- Indent-blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("user.indentline")
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},

	-- Markdown
	-- use {
	--   "ellisonleao/glow.nvim",
	--   branch = 'main'
	-- }

	{ "iamcco/markdown-preview.nvim", lazy = true },

	-- Utility
	{ "stevearc/dressing.nvim", event = "VeryLazy" }, -- 匹配 neovim API
	{ "MunifTanjim/nui.nvim", lazy = true },
	--[[ use({
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }) ]]
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("user.notify")
		end,
	},
	"lewis6991/impatient.nvim", -- 加速 neovim 加载 lua 模块
	"ghillb/cybu.nvim", -- 切换缓冲区
	"moll/vim-bbye", -- 关闭缓冲区但不关闭窗口

	-- Debug
	-- "ravenxrz/DAPInstall.nvim"
	-- 'mfussenegger/nvim-dap'
	-- "rcarriga/nvim-dap-ui"
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- fancy UI for the debugger
			{
				"rcarriga/nvim-dap-ui",
                  -- stylua: ignore
                  keys = {
                    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
                    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
                  },
				opts = {},
				config = function(_, opts)
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup(opts)
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end
				end,
			},

			-- virtual text for the debugger
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},

			-- which key integration
			{
				"folke/which-key.nvim",
				opts = {
					defaults = {
						["<leader>d"] = { name = "+debug" },
						["<leader>da"] = { name = "+adapters" },
					},
				},
			},

			-- mason.nvim integration
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "mason.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				opts = {
					-- Makes a best effort to setup the various debuggers with
					-- reasonable debug configurations
					automatic_setup = true,

					-- You can provide additional configuration to the handlers,
					-- see mason-nvim-dap README for more information
					handlers = {},

					-- You'll need to check that you have the required things installed
					-- online, please don't ask me how to install them :)
					ensure_installed = {
						-- Update this to ensure that you have the debuggers for the langs you want
					},
				},
			},
		},

        -- stylua: ignore
        keys = {
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
        { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
        { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
        { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
        { "<leader>dj", function() require("dap").down() end, desc = "Down" },
        { "<leader>dk", function() require("dap").up() end, desc = "Up" },
        { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
        { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
        { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
        { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
        { "<leader>dr", function() require("dap").repl.open() end, desc = "Repl" },
        { "<leader>ds", function() require("dap").session() end, desc = "Session" },
        { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
        { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
        },

		config = function()
			local Icons = require("user.icons")
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			for name, sign in pairs(Icons.dap) do
				sign = type(sign) == "table" and sign or { sign }
				vim.fn.sign_define(
					"Dap" .. name,
					{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
				)
			end
		end,
	},

	-- Motion
	"phaazon/hop.nvim",

	-- Editing Support
	{
		"folke/zen-mode.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("user.zen-mode")
		end,
	},
	{
		"junegunn/vim-slash",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("user.vim-slash")
		end,
	},
	{
		"andymass/vim-matchup",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("user.matchup")
		end,
	},
	-- 'karb94/neoscroll.nvim'
	{
		"filipdutescu/renamer.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("user.renamer")
		end,
		branch = "master",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	-- animations
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function()
			-- don't use animate when scrolling with the mouse
			local mouse_scrolled = false
			for _, scroll in ipairs({ "Up", "Down" }) do
				local key = "<ScrollWheel" .. scroll .. ">"
				vim.keymap.set({ "", "i" }, key, function()
					mouse_scrolled = true
					return key
				end, { expr = true })
			end

			local animate = require("mini.animate")
			return {
				resize = {
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
					subscroll = animate.gen_subscroll.equal({
						predicate = function(total_scroll)
							if mouse_scrolled then
								mouse_scrolled = false
								return false
							end
							return total_scroll > 1
						end,
					}),
				},
			}
		end,
		config = function(_, opts)
			require("mini.animate").setup(opts)
		end,
	},

	-- Quick Fix
	{ "kevinhwang91/nvim-bqf", lazy = true },

	-- Project
	{
		"ahmedkhalf/project.nvim",
		key = { "F6", "<cmd>Telescope projects<CR>", mode = "n" },
		config = function()
			require("user.project")
		end,
	},

	-- Code Runner
	{ "is0n/jaq-nvim", lazy = true },

	-- Keybinding
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("user.whichkey")
		end,
	},

	-- Note Taking
	{ "mickael-menu/zk-nvim", lazy = true },

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
})

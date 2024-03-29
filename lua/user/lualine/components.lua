local conditions = require("user.lualine.conditions")
local colors = require("user.lualine.colors")
local icons = require("user.icons")

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local statusline_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
local cursorline_hl = vim.api.nvim_get_hl_by_name("CursorLine", true)
local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)

vim.api.nvim_set_hl(0, "SLCopilot", { fg = "#6CC644", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#E8AB53", bg = cursorline_hl.background })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = normal_hl.foreground, bg = cursorline_hl.background })
vim.api.nvim_set_hl(0, "SLProgress", { fg = "#ECBE7B", bg = statusline_hl.background })

local location_color = nil
local branch = icons.git.Branch
local separator = icons.ui.LineMiddle

if vim.coloerscheme == "tokyonight" then
	location_color = "SLBranchName"
	branch = "%#SLGitIcon#" .. icons.git.Branch .. "%*" .. "%#SLBranchName#"

	local status_ok, tnc = pcall(require, "tokyonight.colors")
	if status_ok then
		local tncolors = tnc.setup({ transform = true })
		vim.api.nvim_set_hl(0, "SLSeparator", { fg = cursorline_hl.background, bg = tncolors.black })
		separator = "%#SLSeparator#" .. icons.ui.LineMiddle .. "%*"
	end
end

return {
	mode = {
		function()
			return " " .. icons.ui.Target .. " "
		end,
		padding = { left = 0, right = 0 },
		color = {},
		cond = nil,
	},
	branch = {
		"b:gitsigns_head",
		icon = branch,
		color = { gui = "bold" },
	},
	filename = {
		"filename",
		color = {},
		cond = nil,
	},
	diff = {
		"diff",
		source = diff_source,
		symbols = {
			added = icons.git.LineAdded .. " ",
			modified = icons.git.LineModified .. " ",
			removed = icons.git.LineRemoved .. " ",
		},
		padding = { left = 2, right = 1 },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.yellow },
			removed = { fg = colors.red },
		},
		cond = nil,
	},
	python_env = {
		function()
			local utils = require("lvim.core.lualine.utils")
			if vim.bo.filetype == "python" then
				local venv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")
				if venv then
					local devicons = require("nvim-web-devicons")
					local py_icon, _ = devicons.get_icon(".py")
					return string.format(" " .. py_icon .. " (%s)", utils.env_cleanup(venv))
				end
			end
			return ""
		end,
		color = { fg = colors.green },
		cond = conditions.hide_in_width,
	},
	diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = {
			error = icons.diagnostics.BoldError .. " ",
			warn = icons.diagnostics.BoldWarning .. " ",
			info = icons.diagnostics.BoldInformation .. " ",
			hint = icons.diagnostics.BoldHint .. " ",
		},
		-- cond = conditions.hide_in_width,
	},
	treesitter = {
		function()
			return icons.ui.Tree
		end,
		color = function()
			local buf = vim.api.nvim_get_current_buf()
			local ts = vim.treesitter.highlighter.active[buf]
			return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
		end,
		cond = conditions.hide_in_width,
	},
	lsp = {
		function()
			local buf = vim.api.nvim_get_current_buf()
			local buf_clients = vim.lsp.get_active_clients(buf)
			if #buf_clients == 0 then
                return "LS Inactive"
			end

			local buf_ft = vim.bo.filetype
			local buf_client_names = {}
			local copilot_active = false

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" and client.name ~= "copilot" then
					table.insert(buf_client_names, client.name)
				end

				if client.name == "copilot" then
					copilot_active = true
				end
			end

			-- add formatter
			local formatters = require("user.lsp.null-ls.formatters")
			local supported_formatters = formatters.list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_formatters)

			-- add linter
			local linters = require("user.lsp.null-ls.linters")
			local supported_linters = linters.list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_linters)

			local unique_client_names = vim.fn.uniq(buf_client_names)

			local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"

			if copilot_active then
				language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
			end

			return language_servers
		end,
		separator = separator,
		color = { gui = "bold" },
		cond = conditions.hide_in_width,
	},
	location = { "location", color = location_color },
	progress = {
		"progress",
		fmt = function()
			return "%P/%L"
		end,
		color = {},
	},

	spaces = {
		function()
			local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
			return icons.ui.Tab .. " " .. shiftwidth
		end,
		separator = separator,
		padding = 1,
	},
	encoding = {
		"o:encoding",
		fmt = string.upper,
		color = {},
		cond = conditions.hide_in_width,
	},
	filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } },
	scrollbar = {
		function()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		padding = { left = 0, right = 0 },
		color = "SLProgress",
		cond = nil,
	},
}

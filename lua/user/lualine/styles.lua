local M = {}
local icons = require("user.icons")
local components = require("user.lualine.components")

local styles = {
	fvim = nil,
	default = nil,
	none = nil,
}

styles.none = {
	style = "none",
	options = {
		theme = "auto",
		globalstatus = true,
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}

styles.default = {
	style = "default",
	options = {
		theme = "auto",
		globalstatus = true,
		icons_enabled = true,
		component_separators = {
			left = icons.ui.DividerRight,
			right = icons.ui.DividerLeft,
		},
		section_separators = {
			left = icons.ui.BoldDividerRight,
			right = icons.ui.BoldDividerLeft,
		},
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}

styles.fvim = {
	style = "fvim",
	options = {
		theme = "auto",
		globalstatus = true,
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard" },
	},
	sections = {
		lualine_a = {
			components.mode,
		},
		lualine_b = {
			components.branch,
		},
		lualine_c = {
			components.diff,
			components.python_env,
		},
		lualine_x = {
			components.diagnostics,
			components.lsp,
			components.spaces,
			components.filetype,
		},
		lualine_y = { components.location },
		lualine_z = {
			components.progress,
		},
	},
	inactive_sections = {
		lualine_a = {
			components.mode,
		},
		lualine_b = {
			components.branch,
		},
		lualine_c = {
			components.diff,
			components.python_env,
		},
		lualine_x = {
			components.diagnostics,
			components.lsp,
			components.spaces,
			components.filetype,
		},
		lualine_y = { components.location },
		lualine_z = {
			components.progress,
		},
	},
	tabline = {},
	extensions = {},
}

function M.get_style(style)
	local style_keys = vim.tbl_keys(styles)
	if not vim.tbl_contains(style_keys, style) then
		vim.notify(
			"Invalid lualine style"
				.. string.format('"%s"', style)
				.. "options are: "
				.. string.format('"%s"', table.concat(style_keys, '", "'))
		)
		vim.notify('"vim" style is applied.')
		style = "fvim"
	end

	return vim.deepcopy(styles[style])
end

function M.update()
	local style = M.get_style("fvim")

	Lualine = vim.tbl_deep_extend("keep", Lualine, style)

	local color_template = vim.g.colors_name or vim.colorscheme
	local theme_supported, template = pcall(function()
		require("lualine.utils.loader").load_theme(color_template)
	end)
	if theme_supported and template then
		Lualine.options.theme = color_template
	end
end

return M

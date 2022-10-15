local M = {}
Lualine = {}
M.config = function()
	Lualine = {
		active = true,
		style = "lvim",
		options = {
			icons_enabled = nil,
			component_separators = nil,
			section_separators = nil,
			theme = nil,
			disabled_filetypes = nil,
			globalstatus = true,
		},
		sections = {
			lualine_a = nil,
			lualine_b = nil,
			lualine_c = nil,
			lualine_x = nil,
			lualine_y = nil,
			lualine_z = nil,
		},
		inactive_sections = {
			lualine_a = nil,
			lualine_b = nil,
			lualine_c = nil,
			lualine_x = nil,
			lualine_y = nil,
			lualine_z = nil,
		},
		tabline = nil,
		extensions = nil,
		on_config_done = nil,
	}
end

M.setup = function()
	if #vim.api.nvim_list_uis() == 0 then
		vim.notify("headless mode detected, skipping running setup for lualine")
		return
	end

	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end

	require("user.lualine.styles").update()

	lualine.setup(Lualine)

	if Lualine.on_config_done then
		Lualine.on_config_done(lualine)
	end
end

return M

local status_ok, dap_install = pcall(require, "dap-install")
if not status_ok then
    vim.notify("dap_install is failed to load")
end


dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

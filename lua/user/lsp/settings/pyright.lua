return {
	cmd = { "pyright-langserver", "--stdio" },
	filetype = { "python" },
	settings = {
		python = {
			analysis = {
                autoSearchPaths = true,
				typeCheckingMode = "basic",
				diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
				},
			},
		},
	},
    single_file_support = true
}

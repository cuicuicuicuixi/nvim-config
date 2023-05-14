_G.reload = require("user.modules").reload

require("user.impatient")
reload("user.options")
require("user.keymaps")
require("user.plugins")
require("user.autocommands")
require("user.lsp")
require("user.neovide")
require("user.functions")
reload("user.lualine").setup()

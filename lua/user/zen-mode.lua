local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
  return
end

zen_mode.setup {
  window = {
    backdrop = 0.9,-- 遮蔽禅窗的背景。设置为 1 保持与 Normal 相同
    -- 高度和宽度可以是：
    -- * > 1 时的绝对单元数
    -- * <= 1时编辑器宽度/高度的百分比
    -- * 一个返回宽度或高度的函数
    height = 0.95, -- height of the Zen window
    width = 120, -- width of the Zen window
    options = {
      signcolumn = "no",    -- disable signcolumn
      -- number = false,       -- disable number column
      -- relativenumber = false,   -- disable relative number
      cursorline = true,    -- disable cursorline
      cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
  },
  on_open = function()
    require("lsp-inlayhints").toggle()
    vim.g.cmp_active = false
    vim.cmd [[LspStop]]
    local status_winbar, _ = pcall(vim.api.nvim_set_option_value, "winbar", nil, { scope = "local" })
    if not status_winbar then
      return
    end
    if vim.fn.exists("#" .. "_winbar") == 1 then
      vim.cmd("au! " .. "_winbar")
    end
  end,
  on_close = function()
    require("lsp-inlayhints").toggle()
    vim.g.cmp_active = true
    vim.cmd [[LspStart]]
    require("user.winbar").create_winbar()
  end,
}

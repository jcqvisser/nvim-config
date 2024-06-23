require('utils.ensure-lazy-package-manager-installed')()

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = require('keymap')

require("lazy").setup({
  require("plugins.catppuccin").spec,
  require("plugins.fzf-lua").spec_with_keys(keymap.fzf_lua_lazy),
  require("plugins.mason").spec,
  require("plugins.nvim-cmp").spec,
  require("plugins.nvim-dap-ui").spec,
  require("plugins.nvim-dap-vscode-js").spec,
  require("plugins.nvim-dap").spec_with_keys(keymap.nvim_dap_lazy),
  require("plugins.nvim-lspconfig").spec,
  require("plugins.nvim-tree").spec_with_keys(keymap.nvim_tree_lazy),
  require("plugins.nvim-treesitter").spec,
}, opts)

keymap.setup_lsp_keymap()
keymap.setup_misc_keymap()


vim.bo.softtabstop = 2
vim.cmd.colorscheme("catppuccin-latte")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.mouse = ""
vim.o.number = true
vim.o.termguicolors = true
vim.o.wrap = false

vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.scrolloff = 8 -- tries to keep the cursor 8 lines from the bottom

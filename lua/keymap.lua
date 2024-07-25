local bind_fn = require('utils.keymap-utils').bind_fn;
local bind_cmd = require('utils.keymap-utils').bind_cmd;

return {
  nvim_dap_lazy = function()
    return {
			{ "<leader>dd", function() require('dap').toggle_breakpoint() end },
			{ "<leader>dc", function() require('dap').continue() end },
			{ "<leader>df", function() require('dap').step_over() end },
			{ "<leader>di", function() require('dap').step_into() end },
			{ "<leader>do", function() require('dap').step_out() end },
    } 
  end,

  fzf_lua_lazy = function()
    local find_not_gitignored = function()
      -- NOTE: THIS NEEDS FZF AS WELL AS FD TO WORK
      -- Use this instead of require('fzf-lua').files to avoid searching for git-ignored files
      local fzf_lua = require('fzf-lua')
      opts = opts or {}
      opts.prompt = "file> "
      opts.previewer = "builtin"
      opts.actions = fzf_lua.defaults.actions.files
      fzf_lua.fzf_exec("fdfind", opts)
    end

    return {
      { "<leader>p", find_not_gitignored },
      { "<leader>/", function() require('fzf-lua').lines() end },
      { "<leader>o", function() require('fzf-lua').resume() end },
      { "<leader>f", function() require('fzf-lua').grep() end },
    }
  end,

  nvim_tree_lazy = {
    {"<leader>n", ":NvimTreeFindFileToggle<CR>"}
  },

  setup_lsp_keymap = function()
    bind_cmd("", "<Space>", "<Nop>")
    bind_fn("n", "<leader>lr", vim.lsp.buf.rename)
    bind_fn("n", "<leader>lD", vim.lsp.buf.declaration)
    bind_fn("n", "<leader>ld", vim.lsp.buf.definition)
    bind_fn("n", "<leader>lk", vim.lsp.buf.hover)
    bind_fn("n", "<leader>lI", vim.lsp.buf.implementation)
    bind_fn("n", "<leader>lsh", vim.lsp.buf.signature_help)
    bind_fn("n", "<leader>lc", vim.lsp.buf.code_action)
    bind_fn("n", "<leader>lR", vim.lsp.buf.references)
    bind_fn("n", "<leader>lf", vim.lsp.buf.format)
  end,

  setup_misc_keymap = function()
    bind_cmd("", "<Space>", "<Nop>")
    bind_cmd("n", '<leader>bn', '<cmd>bn<CR>')
    bind_cmd("n", '<leader>bp', '<cmd>bp<CR>')
    bind_cmd("n", '<leader>h', '<cmd>noh<CR>')
    bind_cmd("n", ';', ':')
    vim.cmd('ab Q q')
    vim.cmd('ab Qa qa')
    vim.cmd('ab Qa! qa!')
  end
}

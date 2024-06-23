local spec = {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mxsdev/nvim-dap-vscode-js",
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
    }
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({ reset = true })
    end
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    dap.adapters.chrome = {
        type = "executable",
        command = "node",
        args = {os.getenv("HOME") .. ".local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"}
    }

    -- dap.configurations.typescriptreact = {
    --     {
    --         type = "chrome",
    --         request = "attach",
    --         program = "${file}",
    --         cwd = vim.fn.getcwd(),
    --         sourceMaps = true,
    --         protocol = "inspector",
    --         port = 9222,
    --         webRoot = "${workspaceFolder}"
    --     }
    -- }

    dap.configurations.typescript = require('plugins.nvim-dap-configurations.typescript')
    dap.configurations.javascript = require('plugins.nvim-dap-configurations.javascript')
  end,
}

return {
  spec = spec,
  spec_with_keys = function(keys)
    spec.keys = keys
    return spec
  end
}

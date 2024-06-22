local spec = {
 "mxsdev/nvim-dap-vscode-js",
  lazy = true,
  config = function()
    local dap_vscode_js = require("dap-vscode-js")

    dap_vscode_js.setup({
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost'  },
    })
  end
}

return {
  spec = spec,
  spec_with_keys = function(keys)
    spec.keys = keys
    return spec
  end
}


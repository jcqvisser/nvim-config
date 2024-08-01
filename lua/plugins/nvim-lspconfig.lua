local spec = {
  "neovim/nvim-lspconfig",
  config = function()
    lsp_config = require("lspconfig")

    lsp_config.tsserver.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- lsp_config.gopls.setup({ })
    lsp_config.clangd.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
      end,
      capabilities= capabilities,
      init_options = {
       compilationDatabasePath = './build'
      }
    })

    local ok, mason_registry = pcall(require, 'mason-registry')
    if not ok then
        vim.notify 'mason-registry could not be loaded'
        return
    end

    local angularls_path =
        mason_registry.get_package('angular-language-server'):get_install_path()

    local cmd = {
        'ngserver',
        '--stdio',
        '--tsProbeLocations',
        table.concat({
            angularls_path,
            vim.uv.cwd(),
        }, ','),
        '--ngProbeLocations',
        table.concat({
            angularls_path .. '/node_modules/@angular/language-server',
            vim.uv.cwd(),
        }, ','),
    }

    lsp_config.angularls.setup({
        cmd = cmd,
        on_new_config = function(new_config, new_root_dir)
            new_config.cmd = cmd
        end,
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


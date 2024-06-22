local spec = {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", },
  config = function() 
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "tsserver", -- ts
        "gopls", -- go
        "clangd", -- cpp
        "angularls",
      } 
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

local spec = {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-nvim-lsp", },
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
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

local spec = {
  "nvim-treesitter/nvim-treesitter"
}

return {
  spec = spec,
  spec_with_keys = function(keys)
    spec.keys = keys
    return spec
  end
}


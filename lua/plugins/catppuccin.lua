local spec = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000
}

return {
  spec = spec,
  spec_with_keys = function(keys)
    spec.keys = keys
    return spec
  end
}

local spec = {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() 
      require("nvim-tree").setup()
    end
  }

return {
  spec = spec,
  spec_with_keys = function(keys)
    spec.keys = keys
    return spec
  end
}


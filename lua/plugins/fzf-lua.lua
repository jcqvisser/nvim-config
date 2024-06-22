-- NOTE: THIS NEEDS FZF INSTALLED

local spec = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  config = function() require("fzf-lua").setup({}) end,
}

return {
  spec = spec,
  spec_with_keys = function(keys)
    spec.keys = keys
    return spec
  end
}

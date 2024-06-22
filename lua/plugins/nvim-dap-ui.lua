local spec = {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    config = function()
      require("dapui").setup()
    end
}

return {
  spec = spec,
  spec_with_keys = function(keys)
    spec.keys = keys
    return spec
  end
}


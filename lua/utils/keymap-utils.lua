local bind_fn = function(mode, key, fn)
  vim.keymap.set(mode, key, fn, { silent = true, noremap = true })
end

local bind_cmd = function(mode, key, cmd)
  vim.api.nvim_set_keymap(mode, key, cmd, { silent = true, noremap = true })
end


return {
  bind_fn = bind_fn,
  bind_cmd = bind_cmd,
  allow_adding_keys_to_plugin_spec = allow_adding_keys_to_plugin_spec 
}


local bind_fn = function(mode, key, fn)
  vim.keymap.set(mode, key, fn, { silent = true, noremap = true })
end

local bind_cmd = function(mode, key, cmd)
  vim.api.nvim_set_keymap(mode, key, cmd, { silent = true, noremap = true })
end

local if_installed = function(package_name, callback)
  local is_installed, package = pcall(require, package_name)

  if is_installed then
    return function()
      callback(package_name)
    end
  else
    return function()
      vim.notify("Package " .. package_name .. "is not installed, keybindings for it will be omitted")
    end
  end
end

return {
  bind_fn = bind_fn,
  bind_cmd = bind_cmd,
  if_installed = if_installed,
  allow_adding_keys_to_plugin_spec = allow_adding_keys_to_plugin_spec 
}


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

return if_installed

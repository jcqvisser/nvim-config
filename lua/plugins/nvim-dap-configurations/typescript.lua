local pwa_node_launch = {
  -- use nvim-dap-vscode-js's pwa-node debug adapter
  type = "pwa-node",
  -- launch a new process to attach the debugger to
  request = "launch",
  -- name of the debug action you have to select for this config
  name = "Launch current file in new node process",
  program = "${file}",
}

local pwa_node_attach = {
  -- use nvim-dap-vscode-js's pwa-node debug adapter
  type = "pwa-node",
  -- attach to an already running node process with --inspect flag
  -- default port: 9222
  request = "attach",
  -- allows us to pick the process using a picker
  processId = require 'dap.utils'.pick_process,
  -- name of the debug action
  name = "Attach debugger to existing `node --inspect` process",
  -- for compiled languages like TypeScript or Svelte.js
  sourceMaps = true,
  -- resolve source maps in nested locations while ignoring node_modules
  resolveSourceMapLocations = { "${workspaceFolder}/**",
    "!**/node_modules/**"},
  -- path to src in vite based projects (and most other projects as well)
  cwd = "${workspaceFolder}/src",
  -- we don't want to debug code inside node_modules, so skip it!
  skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
}

local pwa_node_auto_attach = {
  -- use nvim-dap-vscode-js's pwa-node debug adapter
  type = "pwa-node",
  -- attach to an already running node process with --inspect flag
  -- default port: 9222
  request = "attach",
  -- allows us to pick the process using a picker
  -- processId = require 'dap.utils'.pick_process,
  -- name of the debug action
  name = "auto attach",
  -- for compiled languages like TypeScript or Svelte.js
  sourceMaps = true,
  -- resolve source maps in nested locations while ignoring node_modules
  resolveSourceMapLocations = { "${workspaceFolder}/**",
    "!**/node_modules/**"},
  -- path to src in vite based projects (and most other projects as well)
  cwd = "${workspaceFolder}/src",
  -- we don't want to debug code inside node_modules, so skip it!
  skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
}

local pwa_chrome_attach = {
  -- use nvim-dap-vscode-js's pwa-chrome debug adapter
  type = "pwa-chrome",
  request = "launch",
  -- name of the debug action
  name = "Launch Chrome to debug client side code",
  -- default angular dev server url
  url = "http://localhost:4200",
  -- for TypeScript
  sourceMaps = true,
  webRoot = "${workspaceFolder}/src",
  protocol = "inspector",
  port = 9222,
  runtimeExecutable = "/usr/bin/chromium",
  skipFiles = { "**/node_modules/**/*" },
}

local configurations = {
  pwa_node_launch,
  pwa_node_attach,
  pwa_node_auto_attach,
  pwa_chrome_attach
}

return configurations


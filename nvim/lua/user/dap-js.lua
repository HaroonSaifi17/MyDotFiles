local M = {
  "mxsdev/nvim-dap-vscode-js",
  event = "VeryLazy",
}

function M.config()
  require("dap-vscode-js").setup({
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    debugger_path = "/home/haroon/repo/vscode-js-debug"
    -- log_file_path = vim.fn.stdpath('cache') .. "/dap_vscode_js.log", -- Path for file logging
    -- log_file_level = false, -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
  })

  for _, language in ipairs({ "typescript", "javascript" }) do
      require("dap").configurations[language] = {
        {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "${workspaceFolder}",
      }
    }
  }
  end
end

return M

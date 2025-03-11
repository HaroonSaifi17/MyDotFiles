local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.execs = {
  -- "grammarly",
  "marksman",
  "bashls",
  "angularls",
  "pyright",
  "tailwindcss",
  "cssls",
  "emmet_ls",
  "eslint",
  "graphql",
  "html",
  "jsonls",
  "lua_ls",
  "yamlls",
  "rust_analyzer",
  -- "eslint"
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = M.execs,
  }
end

return M

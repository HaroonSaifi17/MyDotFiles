local M = {
  "iamcco/markdown-preview.nvim",
  enabled = true,
  lazy = false,
  keys = {
    {"<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Toggle Preview"},
    {"<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview"},
    {"<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Stop Preview"},
  },
  ft = {"wiki", "markdown", "md", "puml"},
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
return M

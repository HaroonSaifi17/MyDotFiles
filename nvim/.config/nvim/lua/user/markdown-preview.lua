local M = {
  "iamcco/markdown-preview.nvim",
  enabled = true,
  lazy = false,
  keys = {
    { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Toggle Preview" },
    { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
    { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Stop Preview" },
  },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}

return M

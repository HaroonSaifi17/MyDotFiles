-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.diagnostic.config({
  float = {
    border = "rounded",
  },
})

vim.opt.swapfile = false
vim.opt.colorcolumn = "80"
vim.g.ai_cmp = false

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

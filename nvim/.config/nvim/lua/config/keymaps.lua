-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- Remove LazyVim's default <C-s> save mapping
vim.keymap.del({ "n", "i", "x", "s" }, "<C-s>")

-- Add your preferred <leader>w save mapping
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>r", "<cmd>w<CR>", opts)

-- Keep your existing diagnostic float mapping
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- Remove LazyVim's default <C-s> save mapping
vim.keymap.del({ "n", "i", "x", "s" }, "<C-s>")

vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")
vim.keymap.del("i", "<A-j>") -- For visual block mode if mapped
vim.keymap.del("i", "<A-k>")

-- Add your preferred <leader>w save mapping
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>r", "<cmd>w<CR>", opts)

-- Keep your existing diagnostic float mapping
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

map("n", "<A-d>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
map("n", "<A-u>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
map("v", "<A-d>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
map("v", "<A-u>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

map({ "n", "v", "o" }, "<A-j>", "<C-d>", { noremap = true, silent = true, desc = "Page Down (half) & center" })
map({ "n", "v", "o" }, "<A-k>", "<C-u>", { noremap = true, silent = true, desc = "Page Up (half) & center" })

local M = {
  "ChristianChiarulli/defaultplus",
  lazy = false,
}

function M.config()
  vim.cmd.colorscheme("defaultplus")
  vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#333333", nocombine = true })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#333333", nocombine = true })
  vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = "#666666", nocombine = true })
  vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = "#555555", bg = "#1e1e1e", nocombine = true })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#333333", nocombine = true })
end

return M

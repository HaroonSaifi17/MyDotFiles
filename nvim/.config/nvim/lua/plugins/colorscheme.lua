return {
  {
    "ChrlistianChiarulli/defaultplus",
    config = function()
      vim.cmd.colorscheme("defaultplus")
      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#333333", nocombine = true })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#333333", nocombine = true })
      vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = "#444444", nocombine = true })
      vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = "#999999", nocombine = true })
    end,
  },
  {
    "decaycs/decay.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
  },
}

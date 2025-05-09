return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin",
    opts = {
      transparent_background = true,
      flavor = "mocha",
      custom_highlights = function(colors)
        return {
          SnacksIndentScope = { fg = "#6c7086", nocombine = true },
          SnacksIndent = { fg = "#222222", nocombine = true },
          BlinkCmpMenuBorder = { bg = "NONE", fg = "#6c7086", nocombine = true },
          BlinkCmpMenu = { bg = "NONE", nocombine = true },
          BlinkCmpGhostText = { bg = "#2a2b3d", fg = "#6c7086", nocombine = true },
        }
      end,
    },
  },
}

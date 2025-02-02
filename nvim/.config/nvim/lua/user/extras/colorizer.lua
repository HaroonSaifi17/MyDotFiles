local M = {
  "ChristianChiarulli/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  require("colorizer").setup {
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "css",
      "html",
      "astro",
      "lua",
      "scss",
    },
    user_default_options = {
      names = false,
      rgb_fn = true,
      hsl_fn = true,
      tailwind = "both",
      css = true,
      css_fn = true,
    },
    buftypes = {},
  }
end

return M

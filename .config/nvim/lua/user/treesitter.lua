local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {"http","css","javascript","typescript","html","json","scss","lua"},
sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable_virtual_text = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "css" } },
  autotag = {
    enable = true,
    disable = { "xml", "markdown" },
  },
  rainbow = {
    enable = true,
    disable = { "html" },
  }
})
vim.cmd([[hi rainbowcol1 guifg=#ff0000]])

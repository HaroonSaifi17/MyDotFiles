local M = {
  "rcarriga/nvim-notify",
}

function M.config()
  local banned_messages = { "No information available" }
  
  require("notify").setup({
    background_colour = "#000000",
    stages = "fade",
    timeout = 3000,
    top_down = false,
  })
  
  vim.notify = function(msg, ...)
    for _, banned in ipairs(banned_messages) do
      if msg == banned then
        return
      end
    end
    return require("notify")(msg, ...)
  end
end

return M

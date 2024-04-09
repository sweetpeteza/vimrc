return
{
    "rcarriga/nvim-notify",
    init = function()
        vim.opt.termguicolors = true
        require('notify').setup({
            background_colour = "#000000"
        })
        vim.notify = require("notify")
    end
}

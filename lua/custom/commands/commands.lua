vim.api.nvim_create_user_command(
    "S",
    function()
        vim.api.nvim_command(':Neoformat')
        vim.api.nvim_command(':w')
    end,
    { bang = false }
)

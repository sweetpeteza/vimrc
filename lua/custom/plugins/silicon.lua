return
{
    'krivahtoo/silicon.nvim',
    build = "./install.sh",
    cmd = "Silicon",
    config = function()
        require('silicon').setup {
            font = 'JetBrainsMono Nerd Font=34;Noto Color Emoji=34',
            background = '#87f',
            theme = 'Monokai Extended',
            line_number = true,
            line_offset = vim.api.nvim__buf_stats(0).current_lnum,
            pad_vert = 80,
            pad_horiz = 50,
            output = {
                path = "/home/peter/Pictures/Silicon"
            },
            watermark = {
                text = ' @sweetpeteza',
            },
            window_title = function()
                return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ':~:.')
            end,
        }
    end
}

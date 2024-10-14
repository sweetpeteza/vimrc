return
{
    'dgagn/diagflow.nvim',
    enabled = false,
    opts = {
        enable = function()
            return vim.bo.filetype ~= "lazy"
        end,
        format = function(diagnostic)
            return diagnostic.message
        end,
        scope = "line",
        placement = "top",
        text_align = "right",
        show_sign = true,
        padding_right = 1,
        gap = 3,
        update_event = { 'DiagnosticChanged', 'BufReadPost' }, -- the event that updates the diagnostics cache
        toggle_event = { "InsertEnter" },
        render_event = { 'DiagnosticChanged', 'CursorMoved' },
        max_width = 60,     -- The maximum width of the diagnostic messages
        max_height = 10,    -- the maximum height per diagnostics
        severity_colors = { -- The highlight groups to use for each diagnostic severity level
            error = "DiagnosticFloatingError",
            warning = "DiagnosticFloatingWarn",
            info = "DiagnosticFloatingInfo",
            hint = "DiagnosticFloatingHint",
        },
    },
}

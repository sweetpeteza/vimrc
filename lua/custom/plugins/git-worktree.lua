-- git-worktree.lua

return {
    'theprimeagen/git-worktree.nvim',
    init = function()
        require('telescope').load_extension('git_worktree')

        local worktree = require('git-worktree')

        worktree.on_tree_change(
            function(op, metadata)
                if op == worktree.Operations.Switch then
                    vim.cmd('LspRestart')
                end
            end
        )
    end
}

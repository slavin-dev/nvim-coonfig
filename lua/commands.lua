vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]
vim.cmd [[autocmd BufWritePost * GitGutter]]

vim.api.nvim_create_user_command(
    'Dels',
    function()
      vim.cmd [[keeppatterns %substitute/\v\s+$//eg]]
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command("Esfix", "call CocAction('runCommand', 'eslint.executeAutofix')", {})

-- Coc coomands
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
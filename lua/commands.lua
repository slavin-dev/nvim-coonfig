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
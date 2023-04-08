local M = require('utils.mapping')
require('utils.code-actions')

local xmap= M.xmap
local nmap = M.nmap
local nnoremap = M.nnoremap
local inoremap = M.inoremap

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move curent line to top or bottom
nnoremap('<S-Up>', ':m-2<CR>')
nnoremap('<S-Down>', ':m+<CR>')
inoremap('<S-Up>', '<Esc>:m-2<CR>')
inoremap('<S-Down>', '<Esc>:m+<CR>')

-- Move around windows (shifted to the right)
nmap('<A-left>', ':wincmd h<CR>')
nmap('<A-right>', ':wincmd l<CR>')
nmap('<A-top>', ':wincmd k<CR>')
nmap('<A-bottom>', ':wincmd j<CR>')

-- Resize windows
nnoremap('<S-Right>', ':vertical resize +10<CR>')
nnoremap('<S-Left>', ':vertical resize -10<CR>')
nnoremap('<C-S-Up>', ':resize +10<CR>')
nnoremap('<C-S-Down>', ':resize -10<CR>')

-- Jumping
nmap('<C-d>', '5j')
nmap('<C-u>', '5k')


-- Plugins --

-- Coc

-- Coc code actions
nmap('<leader>i', '<Plug>(coc-codeaction)')
nmap('<leader>qf', '<Plug>(coc-fix-current)')
xmap('<leader> a', '<Plug>(coc-codeaction-selected)')
nmap('<leader> a', '<Plug>(coc-codeaction-selected)')
nmap('gd', '<Plug>(coc-definition)')
nmap('gy', '<Plug>(coc-type-definition)')
nmap('gi', '<Plug>(coc-implementation)')
nmap('gr', '<Plug>(coc-references)')
nmap('<leader>qf', '<Plug>(coc-fix-current)')
nmap('<leader>rn', '<Plug>(coc-rename)')
nmap("K", '<CMD>lua _G.show_docs()<CR>')

--  Coc Formatting selected code.
xmap('<leader>f', '<Plug>(coc-format-selected)')
nmap('<leader>f', '<Plug>(coc-format-selected)')

--  Coc List
nnoremap('<leader>ccd', ':CocList diagnostics<CR>')
nnoremap('<leader>cco', ':CocList outline<CR>')

-- Coc diagnostics
nmap(']w', '<Plug>(coc-diagnostic-next)')
nmap('[w', '<Plug>(coc-diagnostic-prev)')

-- End Coc Plugins config

-- NeoTree
nmap('<C-n>', ':NeoTreeReveal<CR>')
nmap('<C-m>', ':NeoTreeShow<CR>')

-- Telescope

nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>fs', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>p', '<cmd>Telescope git_files<cr>')
nnoremap('<leader>fgb', '<cmd>Telescope git_branches<cr>')
nnoremap('<leader>fgc', '<cmd>Telescope git_commits<cr>')

-- Git gutter

nnoremap('<leader>ghc', ':GitGutterLineHighlightsToggle<CR>')
nmap(']h', '<Plug>(GitGutterNextHunk)')
nmap('[h', '<Plug>(GitGutterPrevHunk)')
nmap('ghs', '<Plug>(GitGutterStageHunk)')
nmap('ghu', '<Plug>(GitGutterUndoHunk)')

-- Lazygit
nmap('gg', ':LazyGit<CR>')
nmap('ggc', ':LazyGitFilter<CR>')
nmap('ggf', ':LazyGitFilterCurrentFile<CR>')
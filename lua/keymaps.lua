local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
local M = require('utils.mapping')
require('utils.code-actions')


local xmap= M.xmap
local nmap = M.nmap
local nnoremap = M.nnoremap
local vnoremap = M.vnoremap
local inoremap = M.inoremap
local exp_kset = M.exp_kset

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move curent line to top or bottom
nnoremap('<S-Up>', ':m-2<CR>')
nnoremap('<S-Down>', ':m+<CR>')
inoremap('<S-Up>', '<Esc>:m-2<CR>')
inoremap('<S-Down>', '<Esc>:m+<CR>')

-- Move around windows (shifted to the right)
nnoremap('<leader><left>', ':wincmd h<CR>')
nnoremap('<leader><right>', ':wincmd l<CR>')
nnoremap('<leader><up>', ':wincmd k<CR>')
nnoremap('<leader><down>', ':wincmd j<CR>')

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
--
exp_kset("i", "<c-e>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]])

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

-- NVIM tree
nmap('<C-n>', ':NvimTreeFindFile<CR>')
nmap('<C-m>', ':NvimTreeToggle<CR>')

-- Telescope

nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>rf', '<cmd>Telescope oldfiles<cr>')
nnoremap('<leader>fs', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>p', '<cmd>Telescope git_files<cr>')
nnoremap('<leader>fgb', '<cmd>Telescope git_branches<cr>')
nnoremap('<leader>fgc', '<cmd>Telescope git_commits<cr>')

nnoremap('<leader>fd', '<cmd>Telescope dir live_grep<CR>')
nnoremap('<leader>pd', '<cmd>Telescope dir find_files<CR>')

vim.keymap.set("n", "<leader>fw", live_grep_args_shortcuts.grep_word_under_cursor)

-- Neogit
nnoremap('<leader>g', '<cmd>Neogit<cr>')

-- Diffview
nnoremap('<leader>do', '<cmd>DiffviewOpen<cr>')
nnoremap('<leader>fdo', '<cmd>DiffviewFileHistory<cr>')
nnoremap('<leader>dc', '<cmd>DiffviewClose<cr>')

-- Gitgutter
nnoremap('<leader>ghc', ':GitGutterLineHighlightsToggle<CR>')
nmap(']h', '<Plug>(GitGutterNextHunk)')
nmap('[h', '<Plug>(GitGutterPrevHunk)')
nmap('ghs', '<Plug>(GitGutterStageHunk)')
nmap('ghu', '<Plug>(GitGutterUndoHunk)')

-- BarBar
nnoremap('<leader>tca', '<cmd>BufferCloseAllButCurrent<CR>')
nnoremap('<leader>tc', '<cmd>BufferClose<CR>')
nmap('<leader>tr', '<cmd>BufferRestore<CR>')
nmap('gt', '<cmd>BufferNext<CR>')
nmap('gT', '<cmd>BufferPrevious<CR>')

-- Neorg
nnoremap('<leader>oa', '<cmd>Neorg<CR>')

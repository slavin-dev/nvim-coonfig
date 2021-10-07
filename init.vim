set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'
" Git tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-diagnostic', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-styled-components', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'vim-test/vim-test'
Plug 'easymotion/vim-easymotion'
call plug#end()

let g:coc_global_extensions = [
    \ 'coc-emmet',
    \ 'coc-diagnostic',
    \ 'coc-styled-components',
    \ 'coc-rust-analyzer',
	\ 'coc-snippets',
	\ 'coc-tsserver'
    \ ]


let g:python_host_prog = "/usr/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"

syntax on
set clipboard=unnamedplus
set colorcolumn=120
set background=dark

colorscheme onedark 
set number
set nowrap
set smartcase
set hlsearch
set noerrorbells
set softtabstop=2 tabstop=4 shiftwidth=2
set expandtab
set smartindent
set viminfo='20,<1000
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set cursorline
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=20
set lazyredraw
set list
set lcs+=space:·

if has('persistent_undo')
    set undofile
    silent !mkdir ~/.vim_undo_backup > /dev/null 2>&1
    set undodir=~/.vim_undo_backup
endif

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

map <Space> <Leader>

command! CopyBuffer let @+ = expand('%:p')

nnoremap <c-k> :<c-u>call search('\u')<cr>

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

nnoremap <S-Right> :vertical resize +10<CR>
nnoremap <S-Left> :vertical resize -10<CR>
nnoremap <C-S-Up> :resize +10<CR>
nnoremap <C-S-Down> :resize -10<CR>

map <C-d> 5j
map <C-u> 5k

" xnoremap p "0p

map <F1> <Esc>
imap <F1> <Esc>

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

command Dels :call TrimWhiteSpace()

" NerdTree

function! NERDTreeYankCurrentNode()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        return n.path.getLastPathComponent(1)
    endif
endfunction

command! CopyName let @+ = NERDTreeYankCurrentNode()


" Extensions
au BufRead,BufNewFile *.ftl setfiletype html

" Emmet
 let g:user_emmet_settings = {
  \ 'typescript' : {
  \     'extends' : 'jsx',
  \ },
  \}


" Nerdtree
map <silent> <C-m> :NERDTreeFocus<CR>
map <silent> <C-n> :NERDTreeFind<CR>


" COC
nnoremap <silent> <leader>i :CocAction<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <silent> h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" COC

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" COC eslint
command! -nargs=0 Esfix :call CocAction('runCommand', 'eslint.executeAutofix')
" CocCommand eslint.executeAutofix

" coc go to next eslint problem
nmap ]w <Plug>(coc-diagnostic-next)
nmap [w <Plug>(coc-diagnostic-prev)

" FZF
nnoremap <silent> <leader>p :Files<cr>
nnoremap <silent> <leader>g :GFiles<cr>
nnoremap <silent> <leader>b :Buffers<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" Get files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
  " Rg current word
  nnoremap <Leader>fw :Rg <C-R><C-W><space>
endif


" Raw version with preview
command! -bang -nargs=+ -complete=file Ag call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)

" AgIn: Start ag in the specified directory
function! s:ag_in(bang, ...)
  if !isdirectory(a:1)
    throw 'not a valid directory: ' .. a:1
  endif
  " Press `?' to enable preview window.
  call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)

  " If you don't want preview option, use this
  " call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
endfunction


" Nerd Comment
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

let NERDTreeShowHidden=1

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"" GIT
autocmd BufWritePost * GitGutter

nnoremap <leader>god :Gvdiffsplit!<CR>
nnoremap <leader>gos :Git<CR>
nnoremap <leader>gmt :G mergetool<CR>
nnoremap gdl :diffget //2<CR>
nnoremap gdr :diffget //3<CR>
nnoremap <leader>ghc :GitGutterLineHighlightsToggle<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

if !exists(":Gdiffoff")
  command Gdiffoff diffoff | q | Gedit
endif
nnoremap <leader>gdo :Gdiffoff<CR>

""" Auto pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0

" Complete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Easy motion
map <Leader> <Plug>(easymotion-prefix)

" Git conflict marker
hi DiffAdd      ctermfg=NONE ctermbg=Green
hi DiffChange   ctermfg=NONE ctermbg=NONE
hi DiffDelete   ctermfg=LightBlue ctermbg=Red
hi DiffText     ctermfg=Yellow ctermbg=Red


" Vim test
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

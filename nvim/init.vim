let mapleader="\<Space>"

set encoding=utf-8
set incsearch
set nocompatible
set laststatus=2
set tabstop=2
set expandtab
set shiftwidth=2
set relativenumber
set smartcase
set dictionary+=/usr/share/dict/words
set hlsearch
set ignorecase
set nobackup nowritebackup
nmap gn :%s///gn<cr>
nmap gt :Telescope<cr>
nmap gr :%s///g<cr>

call plug#begin('~/.vim/plugged/')
  Plug 'itchyny/lightline.vim'
call plug#end()

function! g:CopyToClipboard()
  let old_z = @z
  normal! gv"zy
  call system('pbcopy', @z)
  let @z = old_z
endfunction

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

nmap gmv :call RenameFile()<cr>
nnoremap <leader><leader> <C-^>
nnoremap U <c-r>
map <silent> <Leader>c :TComment<CR>
map <silent> <Leader>a :PrettierAsync<CR>
noremap <leader>w :w<CR>
noremap , :set hlsearch! hlsearch?<CR>
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
nmap <leader>f :e %:h/
nmap <silent> <leader>t :StripWhitespace<cr>
nmap <C-b> :CtrlPBuffer<CR>
:nnoremap K i<CR><Esc>

map <leader><up> <c-w><up>
map <leader><down> <c-w><down>
map <leader><left> <c-w><left>
map <leader><right> <c-w><right>

au BufRead,BufNewFile *.md setlocal textwidth=80

" Configs
"
let g:rufo_auto_formatting = 1

let g:coc_global_extensions = ['coc-tsserver']
let g:python_host_prog =  system('pyenv which python | tr -d "\n"')
let g:python3_host_prog =  system('pyenv which python3 | tr -d "\n"')
let g:node_host_prog = system('volta which neovim-node-host | tr -d "\n"')

let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f'
    \ ]
let g:ctrlp_working_path_mode = '0'

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:loaded_perl_provider = 0

let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_key_mappings = {
            \ 'all_maps': 1,
            \ 'global': 1,
            \ 'headers': 1,
            \ 'text_objs': 1,
            \ 'table_format': 1,
            \ 'table_mappings': 0,
            \ 'lists': 1,
            \ 'links': 1,
            \ 'html': 1,
            \ 'mouse': 0,
            \ }

autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

func! GetSelectedText()
  normal gv"xy
  let result = getreg("x")
  return result
endfunc

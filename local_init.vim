" lua require('config')

"" mappings
"faster command
nnoremap ; :
xnoremap ; :

" quicker way to open command window
nnoremap q; q:

" Turn the word under cursor to upper case
inoremap <c-u> <Esc>viwUea

" Turn the current word into title case
inoremap <c-t> <Esc>b~lea

" Insert a space after current character
nnoremap <Space><Space> a<Space><ESC>h

" Yank from current cursor position to the end of the line (make it
" consistent with the behavior of D, C)
nnoremap Y y$

" Move the cursor based on physical lines, not the actual lines.
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap ^ g^
nnoremap 0 g0

" Do not include white space characters when using $ in visual mode,
" see https://vi.stackexchange.com/q/12607/15292
xnoremap $ g_

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_

" Start n^3 in the current working directory
nnoremap <leader>; :NnnPicker %:p:h<CR>

" Use Esc to quit builtin terminal
if has('nvim')
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  " au FileType fzf tunmap <Esc>
endif

" exit search on esc
nnoremap <esc> :noh<return><esc>

" util mappings
" imap <silent> <c-p> <Plug>(completion_trigger)
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

"" Settings
set mouse=a
set tabstop=2
set shiftwidth=2

" better completion
set completeopt=menuone,noinsert,noselect

" avoid extra message
set shortmess+=c

" relative line numbers
set relativenumber

autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2
autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2

" Disable default mappings for nnn
let g:nnn#set_default_mappings = 0
" pass a dictionary with window size
let g:nnn#layout = { 'left': '~20%' } " or right, up, down
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

"" Plugin settings
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" Startify
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

" VimWiki
let g:vimwiki_list = [{'path': '~/Documents/',
                      \ 'syntax': 'markdown', 'ext': '.md' }]

" LSP
" let g:completion_matching_strategy_list = ['exact', 'substring']
" command! Format execute 'lua vim.lsp.buf.formatting()'

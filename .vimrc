syntax on
set nocompatible  " We don't want vi compatibility.
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
filetype plugin indent on
highlight LineNr term=bold cterm=NONE ctermfg=57 ctermbg=NONE gui=NONE
set number
set numberwidth=3

" Nerdtree
silent! nmap <C-n> :NERDTreeToggle<CR>
silent! map <C-b> :NERDTreeFind<CR>
imap § <Esc>
let NERDTreeQuitOnOpen = 1

" For some reason, statusline doesn't appear without this option
set laststatus=2 

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

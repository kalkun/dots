" ---------------------------------------------------------------------------------
"  CONFIGURE VUNDLE
" ---------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" The following are examples of different formats supported.  Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ---------------------------------------------------------------------------------
"  END CONFIGURE VUNDLE
" ---------------------------------------------------------------------------------
"  INSTALL PLUGINS
" ---------------------------------------------------------------------------------

Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'https://github.com/godlygeek/tabular'
Plugin 'udalov/kotlin-vim'
Plugin 'hashivim/vim-hashicorp-tools'
Plugin 'jvirtanen/vim-hcl'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-python/python-syntax'

let g:python_highlight_all = 1

"  Plugin 'autozimu/LanguageClient-neovim'
" Plugin 'reasonml-editor/vim-reason-plus'
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'Shougo/deoplete-lsp'
" Plugin 'hashivim/vim-packer'
" Plugin 'hashivim/vim-vagrant'

" Plugin 'OmniSharp/omnisharp-vim'

"Plugin 'HerringtonDarkholme/yats.vim'
"Plugin 'mhartington/nvim-typescript'
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'Shougo/denite.nvim'

"Plugin 'leafgarland/typescript-vim'

" Plugin 'prabirshrestha/async.vim'
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'neovim/nvim-lsp'
" Plugin 'prabirshrestha/asyncomplete.vim'
" Plugin 'prabirshrestha/asyncomplete-lsp.vim'
" Plugin 'ryanolsonx/vim-lsp-typescript'
" Plugin 'mattn/vim-lsp-settings'

" Plugin 'udalov/kotlin-vim'

" Plugin 'https://github.com/dfxyz/CandyPaper.vim'

" ---------------------------------------------------------------------------------
"  CONFIGURE PLUGINS
" ---------------------------------------------------------------------------------

" nerdtree specific config:
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" if &term =~ '256color'
"     " Disable Background Color Erase (BCE) so that color schemes
"     " work properly when Vim is used inside tmux and GNU screen.
"     set t_ut=
" endif


" :set background=dark
" :set termguicolors
" :colorscheme CandyPaper
" :colorscheme macvim-light
" :colorscheme Chasing_Logic
:colorscheme gruvbox
" :colorscheme OceanicNext
" :colorscheme made_of_code
":set background=light
:redraw!

"  MAPPINGS
" ---------------------------------------------------------------------------------
command Bd bp | sp | bn | bd

nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

nmap <S-Tab> :NERDTree<CR><C-w>=
nmap <C-m> <C-^>
nmap gb :ls<CR>:buffer
tnoremap <ESC> <C-\><C-n>

" Cycle buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>
" nmap <C-S-c> :Bclose<CR>

nmap <C-Del> :%s/\s\+$//g<CR>
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set list

" let g:gruvbox_termcolors=16

autocmd TermOpen * set bufhidden=hide
" Setup on startup:
" :set equalalways
" :vsplit
" :vert term

"
" For NeoVIM language server
"
" required for operations modifying multiple buffers like rename.
set hidden

" set runtimepath+=~/.vim/bundle/LanguageClient-neovim
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
" nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<cr>
" nnoremap <silent> <A-d> :LspDefinition<cr>
" nnoremap <silent> <cr> :LspHover<cr>

autocmd BufNewFile,BufRead *.re set syntax=reason
autocmd BufNewFile,BufRead *.ts set syntax=typescript
autocmd BufNewFile,BufRead *.tsx set syntax=typescript.tsx

autocmd BufNewFile,BufRead *.kt set syntax=kotlin
autocmd BufNewFile,BufRead *.hcl set syntax=hcl

let g:ftplugin_sql_omni_key = '<C-K>'

set termguicolors

" Fix from: https://github.com/onivim/oni/issues/2342#issuecomment-402953008
tnoremap <s-space> <space>

"Remove all trailing whitespace by pressing F5
nnoremap <C-c> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>


"https://vim.fandom.com/wiki/Moving_lines_up_or_down#:~:text=In%20normal%20mode%20or%20in,to%20move%20the%20block%20up.
nnoremap ‹ :m .+1<CR>==
nnoremap ∆ :m .-2<CR>==
inoremap ‹ <Esc>:m .+1<CR>==gi
inoremap ∆ <Esc>:m .-2<CR>==gi
vnoremap ‹ :m '>+1<CR>gv=gv
vnoremap ∆ :m '<-2<CR>gv=gv

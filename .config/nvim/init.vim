call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tranvansang/octave.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vimlab/split-term.vim'
Plug 'preservim/nerdtree'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'
Plug 'w0rp/ale'
Plug 'vim-test/vim-test'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'chrisbra/Colorizer'
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"" General
set number
set relativenumber
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set mouse=a
set splitbelow
set splitright
set autoindent
set smartindent
set smarttab
set noexpandtab
set encoding=UTF-8
set autoread
set smartindent
set cindent
"" FZF config
nnoremap <C-F> :Files<CR>
"" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nmap <C-Q> :NERDTreeToggle<CR>
nmap <C-A> :NERDTreeFocus<CR>
nmap <C-U> :TestFile <CR>
nmap <C-T> :split <bar> resize 20 <bar> terminal<CR>
vmap <leader>y "*y
nmap <leader>p "*p
tnoremap jj <C-\><C-n>

"" Eslint
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier']
 \ }

"" Git gutter config
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 0
let NERDTreeShowHidden=1
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:ale_fix_on_save = 1

syntax on
set t_Co=256
set cursorline
set guifont=DroidSansMono_Nerd_Font:h11

let g:test#javascript#runner = 'jest'

"" Color scheme
colorscheme dracula
let g:dracula_colorterm = 1
hi Normal guibg=NONE ctermbg=NONE

"" Jedi vim
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"" COC
nmap <silent> \ge <Plug>(coc-definition)

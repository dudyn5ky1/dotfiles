call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tranvansang/octave.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'vimlab/split-term.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'alvan/vim-closetag'
Plug 'w0rp/ale'
Plug 'vim-test/vim-test'
" Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'dudyn5ky1/vim', { 'as': 'dracula' }
Plug 'chrisbra/Colorizer'
Plug 'davidhalter/jedi-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'izifortune/weblink.vim'
Plug 'dudyn5ky1/weblink.vim'
Plug 'mhinz/vim-startify'
" Plug '907th/vim-auto-save'
Plug 'tpope/vim-rails'
" Plug 'dudyn5ky1/follow-markdown-links'
" Plug '~/Desktop/projects/github/follow-markdown-links'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'lervag/vimtex'
" Plug 'SirVer/ultisnips'
Plug 'mechatroner/rainbow_csv'
Plug 'vim-ruby/vim-ruby'
Plug 'vimwiki/vimwiki'
Plug 'ianks/vim-tsx'
Plug 'jbyuki/instant.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

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
set fileencoding=utf-8
set autoread
set smartindent
set cindent

"" Search and replace highlight
set inccommand=nosplit

"" Vim collaboration
let g:instant_username = "maksym_work"

"" Fix for copying to system clipboard
:let $LANG='en_US.UTF-8'

"" FZF config
nnoremap <C-F> :FZF<CR>
nnoremap <C-G> :Ag<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nmap <C-Q> :NERDTreeToggle<CR>
nmap <C-A> :NERDTreeFocus<CR>
nmap <C-U> :TestFile<CR>
nmap <C-T> :split <bar> resize 20 <bar> terminal<CR>
vmap <leader>y "*y
nmap <leader>p "*p
tnoremap jj <C-\><C-n>
nnoremap D :move +1<CR>
nnoremap U :move -2<CR>


"" Eslint
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier'],
 \ 'typescript': ['tslint', 'prettier', 'eslint'],
 \ 'javascript.jsx': ['eslint'],
 \ 'typescript.jsx': ['eslint'],
 \ 'ruby': ['rubocop']
 \ }

"" Git gutter config
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 0

"" Open vim fugitive diff in vertical splits
set diffopt+=vertical

let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:ale_fix_on_save = 1

syntax on
set t_Co=256
set cursorline

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

"" Weblink
let g:weblink_host_url = "https://stash.ryanair.com"
let g:weblink_host_url_prefix = "/projects/"

"" Navigation between panes
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

"" Markdown preview
let g:mkdp_auto_close = 0

"" Nerd tree config
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusUseNerdFonts = 1
set guifont=DroidSansMono_Nerd_Font:h11

"" Startify. Prevent changing working directory
let g:startify_change_to_dir = 0
let g:startify_custom_header_quotes = [
        \ systemlist("~/scripts/get_quotes.sh")
        \ ]

"" Fix for wrong template literal highlight
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 0


"" Autosave files
" let g:auto_save = 1

"" Goyo / Limelight
let g:limelight_conceal_ctermfg = 238
function! s:goyo_leave()
  hi Normal guibg=NONE ctermbg=NONE
  Limelight!
endfunction
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"" Vim-tex
" set conceallevel=1
" let g:tex_conceal='abdmg'
" let g:tex_flavor = 'latex'


"" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["vim-snippets"]

"" Spellcheck
" setlocal spell
" set spelllang=en_gb,pl,uk,ru
" inoremap <C-y> <c-g>u<Esc>[s1z=`]a<c-g>u

"" Vim wiki
set nocompatible
filetype plugin on
let g:vimwiki_list = [{'path': '~/Documents/notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

set backspace=indent,eol,start

"" LSP autocompletion
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

"" Compe
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

"" Svelte (treat .svelte as .html)
au! BufNewFile,BufRead *.svelte set ft=html

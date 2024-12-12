:set number
:set relativenumber
:set modifiable
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:set splitright

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' "Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree' " File Bwoser
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gcg
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigationi
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'loctvl842/monokai-pro.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'debugloop/telescope-undo.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'm4xshen/autoclose.nvim'

Plug 'https://github.com/maan2003/lsp_lines.nvim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip',
Plug 'rafamadriz/friendly-snippets',

Plug 'hedyhli/outline.nvim',

Plug 'ziglang/zig.vim'
call plug#end()

lua require('telescope_config')
lua require('cmp_config')
lua require('lsp')
lua require('monokai')
lua require('treesitter')
lua require('outline_config')
lua require("autoclose").setup()

let mapleader=" "

function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

nnoremap <C-f> :call NerdTreeToggleFind()<CR>
nmap <F8> :TagbarToggle<CR>

nnoremap * :keepjumps normal! mi*i<CR>

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>o <cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols={'function', 'class'}, show_line=true})<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').lsp_document_symbols({ show_line=true})<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>u <cmd>Telescope undo<cr>

nnoremap <leader>d <cmd>Telescope file_browser path=%:p:h select_buffer=true grouped=true<CR>

nnoremap <leader>t <cmd>lua vim.lsp.buf.hover()<CR>

nnoremap <leader>x :bd<CR>
nnoremap <leader>r :%s//
nnoremap <leader>c :noh<CR>
nnoremap <C-q>q :q<CR>
nnoremap <C-s> :w<CR>


let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1 
let g:zig_fmt_autosave = 1


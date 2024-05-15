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
Plug 'https://github.com/preservim/nerdtree' " File Bwoser
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gcg
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Termina
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigationi
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'loctvl842/monokai-pro.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'neoclide/coc-json', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'npm install --frozen-lockfile'}

call plug#end()

lua require('monokai')
lua require('treesitter')
source plugin/coc.vim

nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-b> :Files<CR>
nnoremap <C-n> :Buffers<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-t> :vsplit term://bash<CR>
tnoremap <Esc> <C-\><C-n>
nmap <F8> :TagbarToggle<CR>



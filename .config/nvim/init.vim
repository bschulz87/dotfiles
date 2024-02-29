set visualbell
set noswapfile
set relativenumber
set number
set autoindent expandtab tabstop=2 shiftwidth=2
set colorcolumn=80
set termguicolors
"set autochdir "can mess up plugins"
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/tokyonight.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'benwainwright/fzf-project'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'ldelossa/nvim-dap-projects'
Plug 'tpope/vim-obsession'
Plug 'airblade/vim-gitgutter'
Plug 'google/vim-jsonnet'
Plug 'dyng/ctrlsf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'jparise/vim-graphql'
Plug 'Pocco81/auto-save.nvim'
Plug 'pseewald/anyfold'
Plug 'christoomey/vim-tmux-navigator'
Plug 'folke/persistence.nvim'
call plug#end()

" source "./llm.vim""

lua << EOF
require("auto-save").setup {
  -- https://github.com/pocco81/auto-save.nvim#%EF%B8%8F-configuration
}

local dap = require('dap')

dap.adapters.dart = {
    type = "executable",
    command = "node",
    args = {"/home/ben/work/github/Dart-Code/out/dist/debug.js", "flutter"}
}
dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch flutter",
      dartSdkPath = "/home/ben/.asdf/installs/flutter/3.13.3-stable/bin/cache/dart-sdk/",
      flutterSdkPath = "/home/ben/.asdf/installs/flutter/3.13.3-stable",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
      args = { '--flavor', 'stage', '--dart-define', 'ENVIRONMENT=stage' },
    }
  }
EOF

let $FZF_DEFAULT_COMMAND = 'fd --type f --exclude .git --exclude vendor --exclude "chunk-*" --ignore-file ~/.gitignore'
let g:fzfSwitchProjectWorkspaces = [ '~/work' ]
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

colorscheme tokyonight
let g:airline_theme = 'minimalist'

let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']
let g:flutter_show_log_on_run = 0
let g:flutter_autoscroll = 1
let g:flutter_close_on_quit = 1
let g:javaScript_fold = 1
filetype plugin indent on " required
syntax on                 " required
autocmd Filetype * AnyFoldActivate               " activate for all filetypes
autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific filetype
set foldlevel=99 " Open all folds

let mapleader=","
"nnoremap <leader>tt :NERDTreeToggle<cr>
nmap <C-P> :FZF<CR>
xmap <C-P> :FZF<CR>
"nmap <C-B> :Buffers<CR>
"xmap <C-B> :Buffers<CR>

nnoremap <leader>fa :FlutterRun
nnoremap <leader>fas :FlutterRun --flavor stage --dart-define ENVIRONMENT=stage<cr>
nnoremap <leader>fad :FlutterRun --flavor dev --dart-define ENVIRONMENT=dev<cr>
nnoremap <leader>fasb :FlutterRun -t lib/src/showcase/main.dart -d chrome<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

xmap <leader>a <Plug>(coc-codeaction-selected)<cr>
nmap <leader>a <Plug>(coc-codeaction-selected)<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

try
    nmap <silent> [C :call CocAction('diagnosticNext')<cr>
    nmap <silent> ]C :call CocAction('diagnosticPrevious')<cr>
endtry

nmap <leader>+l :Limelight!!<CR>
xmap <leader>+l :Limelight!!<CR>
nmap <leader>+g :Goyo<CR>
xmap <leader>+g :Goyo<CR>

nnoremap <C-f> :CtrlSF

" Use ctrl-[hjkl] to select the tmux pane "
nmap <c-k> :TmuxNavigateUp<CR>
nmap <c-j> :TmuxNavigateDown<CR> 
nmap <c-h> :TmuxNavigateLeft<CR> 
nmap <c-l> :TmuxNavigateRight<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usage:
"   1. Create necessary folders and files.
"      $VIMDATA      x:\vim\vimdata on windows, ~/.vim/vimdata on linux
"       |-- temp        dir to put swap files when :set swapfile
"       |-- backup      dir to put backup files when :set backup
"       |-- diary       dir to store calendar.vim's diaries
"       |-- GetLatest   dir to store getscript.vim's downloads
"       |     `-- GetLatestVimScripts.dat
"       |-- _vim_fav_files       file to store favmenu.vim's items
"       `-- _vim_mru_files       file to store mru.vim's items
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " use vim as vim, put at the very start
map Q gq
" do not use Ex-mode, use Q for formatting
set history=400         " lines of Ex commands, search history ...
set browsedir=buffer    " use the directory of the related buffer
" set clipboard+=unnamed  " use register '*' for all y, d, c, p ops
set isk+=$,%,#          " none of these should be word dividers
set autoread            " auto read when a file is changed outside
set confirm             " raise a confirm dialog for changed buffer
set fenc=utf-8          " character encoding for file of the buffer
set fencs=ucs-bom,utf-8,gb18030,gbk,gb2312,cp936
set timeoutlen=200      " Time to wait after ESC (default causes an annoying delay)
filetype plugin indent on      " enable filetype plugin

if $TERM != "linux" && $TERM != "screen" && $TERM != "rxvt-unicode"
    set mouse=a           " except screen & SecureCRT's linux terminal
endif

let mapleader = " "     " set mapleader, then <leader> will be ,
let g:mapleader = " "
let maplocalleader = ","     " set mapleader, then <leader> will be ,
" fast saving
"nmap <leader>w :w!<cr>
nmap <F1> :w!<cr>
imap <F1> <C-O>:w!<cr>
nmap <silent> <leader>fs :w<cr>
map <silent> <leader>s :w!<cr>
"nmap <leader>f :find<cr>

if has("win32")         " platform dependent
    let $VIMDATA  = $HOME.'\vimdata'
    let $VIMFILES = $HOME.'\vimfiles'
else
    let $VIMDATA  = $HOME.'/.vim/vimdata'
    let $VIMFILES = $HOME.'/.vim'
    " let $SPELLFILE = $VIMDATA.'/spellfile.txt'
endif
" fast sourcing and editing of the .vimrc
"map <leader>s :source $MYVIMRC<cr>
map <leader>e :e! $MYVIMRC<cr>
map <silent> <leader>fed :e $MYVIMRC<cr>
au! BufWritePost [\._]vimrc source $MYVIMRC
au! BufWritePost init.vim source $MYVIMRC

" set spellfile+=$SPELLFILE

set pastetoggle=<F6>    " when pasting something in, don't indent
set rtp+=$VIMDATA       " add this to rtp to satisfy getscript.vim
set path=.,/usr/include/*, " where gf, ^Wf, :find will search
set tags=./tags,tags,.tmtags    " used by CTRL-] together with ctags
set makeef=error.err    " the errorfile for :make and :grep
set ffs=unix,dos,mac    " behaves good under both linux/windows
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Options: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set tabstop=2
set numberwidth=4
" set smarttab            " use tabs at start of a line, spaces elsewhere
set fo=tcrqnmM		      " see help formatoptions (complex)
set linebreak           " wrap long lines at a character in 'breakat'
set textwidth=500       " maximum width of text that is being inserted
" set ts=2 sts=2 sw=2
au FileType mail setl textwidth=78
" set ai                  " autoindent
set si                  " smartindent
" set copyindent
set wrap                " wrap lines

"noremap <leader>; :make<CR>
" Map ; to "add ; to the end of the line, when missing"
noremap <leader>; :s/\([^;]\)$/\1;/<cr>:let @/=""<cr><esc>

" }}}1

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
let g:python_host_prog = '~/.asdf/shims/python'
let g:python3_host_prog = '~/.asdf/shims/python3'

if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

  " \   'python': [
  " \       'remove_trailing_lines',
  " \       'trim_whitespace',
  " \       'autopep8',
  " \       'black',
  " \       'isort',
  " \       'add_blank_lines_for_python_control_statements',
  " \   ],

let g:ale_fixers = {
  \   'python': [
  \       'remove_trailing_lines',
  \       'trim_whitespace',
  \       'autopep8',
  \       'black',
  \       'isort',
  \       'add_blank_lines_for_python_control_statements',
  \   ],  
  \   'go': [
  \       'remove_trailing_lines',
  \       'trim_whitespace',
  \       'gofmt',
  \       'goimports',
  \   ],
  \   'json': [
  \       'prettier',
  \   ],
  \   'cpp': [
  \       'clang-format',
  \   ],
  \   'c': [
  \       'clang-format',
  \   ],
  \   'terraform': [
  \       'terraform',
  \   ],
  \   'hcl': [
  \       'terraform',
  \   ],
  \   'typescript': [
  \       'tslint',
  \       'prettier',
  \   ],
  \   'yaml': [
  \       'prettier',
  \   ],
  \}
 " let g:ale_python_pylint_use_global = 1
 " let g:ale_python_pyls_use_global = 1
 " let g:ale_python_reorder_python_imports_use_global = 1
 " let g:ale_python_autopep8_use_global = 1
let g:ycm_semantic_triggers = { 'python' : [] }

let g:ale_linters = {
  \   'cpp': [
  \   ],
  \   'c': [
  \   ],
  \   'python': [
  \   ],
  \ }
 " let g:ale_python_auto_pipenv=1
 let g:ale_yaml_yamllint_options = "-d relaxed"
 let g:ale_yaml_yamllint_options = "-c ~/.config/yamllint.yml"
 " let g:ale_python_auto_pipenv = 1
 " let pipenv_venv_path = system('pipenv --venv')
 let g:ale_lint_on_text_changed = 'normal'
 let g:ale_lint_on_insert_leave = 0

 let test#strategy = "vimterminal"
 " let test#strategy = "asyncrun"

 let g:nv_search_paths = ['~/org']

 let g:typescript_indent_disable = 1

 nmap <silent> t<C-n> :TestNearest<CR>
 nmap <silent> t<C-f> :TestFile<CR>
 nmap <silent> t<C-s> :TestSuite<CR>
 nmap <silent> t<C-l> :TestLast<CR>
 nmap <silent> t<C-g> :TestVisit<CR> fs

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'scrooloose/nerdtree'

Plug 'andymass/vim-matchup'
Plug 'jmcantrell/vim-virtualenv'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-obsession'
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'idanarye/vim-merginal'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-dispatch'

Plug 'vim-scripts/LargeFile'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_enabled = 0

" Navigation
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'

" Version control
Plug 'akinsho/git-conflict.nvim'

" Languages
" Plug 'leafgarland/typescript-vim'
" Plug 'pangloss/vim-javascript'
" Plug 'cespare/vim-toml'
" Plug 'vim-scripts/JavaDecompiler.vim'
" Plug 'rhysd/vim-clang-format'
" Plug 'udalov/kotlin-vim'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'hashivim/vim-terraform'
" Plug 'elzr/vim-json'
" Plug 'towolf/vim-helm'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'rust-lang/rust.vim'
"
" Themes
Plug 'folke/tokyonight.nvim'
Plug 'reedes/vim-colors-pencil'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'


if has('nvim')
  Plug 'github/copilot.vim'
  Plug 'lambdalisue/suda.vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  " Plug 'ggandor/leap.nvim'
  Plug 'numToStr/Comment.nvim'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'Shatur/neovim-tasks'
  " Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  Plug 'smartpde/telescope-recent-files'
  Plug 'kkharji/sqlite.lua'
  " Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'ahmedkhalf/project.nvim'
  " Plug 'Shatur/neovim-session-manager'
  Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
  Plug 'akinsho/toggleterm.nvim'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'ryanoasis/vim-devicons'       " vimscript
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim' 
  " Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-orgmode/orgmode'
  Plug 'akinsho/org-bullets.nvim'
  Plug 'mhartington/formatter.nvim'
  "Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  " function! UpdateRemotePlugins(...)
  "     " Needed to refresh runtime files
  "     let &rtp=&rtp
  "     UpdateRemotePlugins
  " endfunction
  " Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  " LSP Support
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'

  " Autocompletion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua'

  "  Snippets
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'

  Plug 'VonHeikemen/lsp-zero.nvim'
  Plug 'tamago324/nlsp-settings.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'windwp/nvim-autopairs',
  Plug 'antoinemadec/FixCursorHold.nvim'
  Plug 'klen/nvim-test'
  Plug 'TimUntersberger/neogit'
  Plug 'folke/neodev.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'pbogut/fzf-mru.vim'
  " Plug 'konapun/vacuumline.nvim'
  " Plug 'glepnir/galaxyline.nvim'
  " Plug 'nvim-neotest/neotest'
  " Plug 'nvim-neotest/neotest-python'
  " Plug 'nvim-neotest/neotest-plenary'
  " Plug 'nvim-neotest/neotest-vim-test'

  " set
  autocmd TermEnter term://*toggleterm#*
        \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

  " By applying the mappings this way you can pass a count to your
  " mapping to open a specific window.
  " For example: 2<C-t> will open terminal 2
  nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
  inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
else
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
  Plug 'jceb/vim-orgmode'
  " Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'vim-test/vim-test'
  Plug 'Alok/notational-fzf-vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim'
  Plug 'airblade/vim-gitgutter'
  let g:gitgutter_enabled = 0
  Plug 'dense-analysis/ale'
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" let g:deoplete#enable_at_startup = 1
" Plug 'Shougo/echodoc.vim'

" For conceal markers.
" Plug 'itchyny/lightline.vim'
" Initialize plugin system

" Plug 'editorconfig/editorconfig-vim'

" Plug 'plytophogy/vim-virtualenv'
call plug#end()

if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "vimterminal"
endif

 " call wilder#set_option('pipeline', [
 "      \   wilder#branch(
 "      \     wilder#cmdline_pipeline({
 "      \       'language': 'python',
 "      \       'fuzzy': 1,
 "      \     }),
 "      \     wilder#python_search_pipeline({
 "      \       'pattern': wilder#python_fuzzy_pattern(),
 "      \       'sorter': wilder#python_difflib_sorter(),
 "      \       'engine': 're',
 "      \     }),
 "      \   ),
 "      \ ])

 if has('nvim')
   " set completeopt=menu,menuone,noselect
  let g:airline#extensions#nvimlsp#enabled = 1
  let g:airline#extensions#nvimlsp#error_symbol = 'E:'
  let g:airline#extensions#nvimlsp#warning_symbol = 'W:'
  let g:airline#extensions#nvimlsp#show_line_numbers = 1
  let g:airline#extensions#nvimlsp#open_lnum_symbol = '(L'
  let g:airline#extensions#nvimlsp#close_lnum_symbol = ')'

lua <<EOF



-- require('vacuumline').setup()
require('gitsigns').setup() 
require('neogit').setup {}
require('sqlite')
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
local npairs = require "nvim-autopairs"
npairs.setup {
  check_ts = true,
}
npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
require('telescope').load_extension('fzf')
-- require("telescope").load_extension("frecency")
require('telescope').load_extension('projects')
require("telescope").load_extension("recent_files")
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('orgmode').setup_ts_grammar()
require'nvim-treesitter.configs'.setup {
  on_config_done = nil,
  ensure_installed = {}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {},
  matchup = {
    enable = false, -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
    disable = { "latex" },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      -- Languages that have a single comment style
      typescript = "// %s",
      css = "/* %s */",
      scss = "/* %s */",
      html = "<!-- %s -->",
      svelte = "<!-- %s -->",
      vue = "<!-- %s -->",
      json = "",
    },
  },
  indent = { enable = true, disable = { "yaml", "python" } },
  autotag = { enable = false },
  textobjects = {
    swap = {
      enable = false,
      -- swap_next = textobj_swap_keymaps,
    },
    -- move = textobj_move_keymaps,
    select = {
      enable = false,
      -- keymaps = textobj_sel_keymaps,
    },
  },
  textsubjects = {
    enable = false,
    keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
  },
  playground = {
    enable = false,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  rainbow = {
    enable = false,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
}

require('nvim-test').setup {
  term = "toggleterm",          -- a terminal to run ("terminal"|"toggleterm")
    termOpts = {
    direction = "float",   -- terminal's direction ("horizontal"|"vertical"|"float")
    width = float,               -- terminal's width (for vertical|float)
    height = float,              -- terminal's height (for horizontal|float)
    go_back = false,          -- return focus to original window after executing
    stopinsert = "auto",      -- exit from insert mode (true|false|"auto")
    keep_one = true,          -- keep only one terminal for testing
  },
}

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})

require('Comment').setup()
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

require("neodev").setup({})
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.set_preferences({
  suggest_lsp_servers = false,
})
local lua_opts = {
  settings = {
    Lua = {
      telemetry = { enable = false },
      runtime = {
        version = "LuaJIT",
        special = {
          reload = "require",
        },
      },
      diagnostics = {
        globals = { "vim", "lvim", "packer_plugins", "reload" },
      },
      workspace = default_workspace,
    },
  },
}

local yaml_opts = {
  settings = {
    yaml = {
      hover = true,
      completion = true,
      validate = true,
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        kubernetes = {
          "daemon.{yml,yaml}",
          "manager.{yml,yaml}",
          "restapi.{yml,yaml}",
          "role.{yml,yaml}",
          "role_binding.{yml,yaml}",
          "*onfigma*.{yml,yaml}",
          "*ngres*.{yml,yaml}",
          "*ecre*.{yml,yaml}",
          "*eployment*.{yml,yaml}",
          "*ervic*.{yml,yaml}",
          "kubectl-edit*.yaml",
        },
      },
    },
  },
}

lsp.ensure_installed({
  "html",
  "cssls",
  "tsserver",
  "eslint",
  "rome",
  -- "ltex-ls",
  "terraformls",
  "vimls",
})


local ltexls_opts = {
  settings = {
    use_spellfile = true,
  }
}
-- suggest_lsp_servers = false,
lsp.setup_servers({'yamlls', opts = yaml_opts})
lsp.setup_servers({'sumneko_lua', opts = lua_opts})
lsp.setup_servers({'ltex-ls', opts = ltexls_opts})

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})


null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
  }
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

-- require("null-ls").setup({
--     sources = {
--         require("null-ls").builtins.formatting.stylua,
--         require("null-ls").builtins.diagnostics.eslint,
--         require("null-ls").builtins.completion.spell,
--     },
-- })
--
local nlspsettings = require("nlspsettings")

nlspsettings.setup({
  config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
  local_settings_dir = ".nlsp-settings",
  local_settings_root_markers_fallback = { '.git' },
  append_default_schemas = true,
  loader = 'json'
})

require("project_nvim").setup {
  -- detection_methods = {"lsp"},
  ignore_lsp = {"texlab"},
}

require("toggleterm").setup {
    open_mapping = [[c\-\-]],
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
  vim.cmd("startinsert!")
  vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
  vim.cmd("Closing terminal")
  end,
})

local bash = Terminal:new({
  cmd = "bash",
  hidden = true,
  dir = "git_dir",
  direction = "float",
  float_opts = {
      border = "double",
  },
})

function _bash_toggle()
  bash:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>lua _bash_toggle()<CR>", {noremap = true, silent = true})

local tig = Terminal:new({
  cmd = "tig",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
  vim.cmd("startinsert!")
  vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
  vim.cmd("Closing terminal")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _tig_toggle()
  tig:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _tig_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "c-=", "<cmd>lua _tig_toggle()<CR>", {noremap = true, silent = true})


vim.api.nvim_set_keymap('n', '\\',
":<C-u>Tree -columns=mark:indent:git:icon:filename:size:time"..
" -split=vertical -direction=topleft -winwidth=40 -listed `expand('%:p:h')`<CR>",
{noremap=true, silent=true})

EOF

endif

command! NNN FloatermNew nnn
" }}}1
let g:pencil_higher_contrast_ui = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors And Fonts: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable           " enable syntax hl

if has("win32")
  try | set gfn=Consolas:h11:cANSI | catch | endtry " Vista only
elseif has("gui_macvim")
  set gfn=Monaco:h13,Consolas:h13,Inconsolata:h14,PanicSans:h12
else
  " set gfn=xos4\ Terminess\ Powerline\ 11
  " set gfn=Hack\ 11
  set gfn=Iosevka\ SS08\ Medium\ Extended\ 11
endif

" let g:Powerline_symbols = 'fancy'
" let g:airline_powerline_fonts=1

let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
" Setting the airline symbols
" if !exists('g:airline_symbols')
"   let g:airline_left_sep = '⮀'
"   let g:airline_right_sep = '⮂'
"   let g:airline_right_alt_sep ="❮"
"   let g:airline_left_alt_sep="❯"
"   let g:airline_symbols = {}
"   let g:airline_symbols.branch = '⭠'
"   let g:airline_symbols.readonly = '⭤'
"   let g:airline_symbols.linenr = '⭡'
" endif

fu! LightBackground()
  set background=light
  color pencil
endfu
" matchparentesis is pretty slow on big files :(
let loaded_matchparen = 1
if has("gui_running")
  " prepare path
  "set shell=$VIMDATA/path.sh
  " the `b' puts a scrollbar at the bottom, which has no effect if wrap is set
  " e sets the gui tabline
  " r sets the right scrollbar
  set guioptions-=Tm
  set guioptions=age
  set tabpagemax=30
  set mousehide

  set columns=90
  if has("gui_gtk2")
    set lines=30
    set showcmd
  elseif has("gui_macvim") || has("gui_mac")
    set columns=190
    set lines=59
  else
    set lines=50
    set cursorline
  endif

  let psc_style='cool'

  " colo desert
  colo wombat

else
  if (has("nvim"))
    colo tokyonight
  else
    colo onedark
  endif
  set title
  "set background=light
  "colo ir_black
  " set background=dark
  " colo wombat256
  " colo jellybeans
  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (empty($TMUX))
    if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif
  " set termguicolors

  if has("termguicolors")     " set true colors
    " change ^[ to real escape!
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
  endif

  if $TERM == "rxvt-unicode-256color"
    set t_Co=256
    "colo desert256
    " colo wombatc
    " colo hybrid
    " colo desertc
    " colo leo
    " colo gardener
    " colo inkpot
  elseif $TERM == "alacritty"
    call LightBackground()
  elseif $TERM == "screen-256color"
    " simply use c-v to create these maps
    noremap [k;5D <c-left>
    noremap [1;5C <c-right>
    noremap [1;2D <s-left>
    noremap [1;2C <s-right>
    inoremap [1;5D <c-left>
    inoremap [1;5C <c-right>
    inoremap [1;2D <s-left>
    inoremap [1;2C <s-right>
    cnoremap [1;5D <c-left>
    cnoremap [1;5C <c-right>
    cnoremap [1;2D <s-left>
    cnoremap [1;2C <s-right>
    inoremap OP <C-O>:w!<cr>

    " fix mouse selection dragging and scrolling
    set ttymouse=xterm2
    " set termguicolors

    " colo wombat256mod
  elseif has("win32")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colo wombat256mod
  endif
  " let g:Powerline_symbols = 'unicode'
endif


if has("win32")
  set rtp+=$VIMFILES/runtime/win
  runtime plugin/visual_studio.vim
endif

" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7         " minimal screen lines above/below cursor
set wildmenu            " :h and press <Tab> to see what happens
set wig=*.o,*.pyc,*.tiff,*.jpg,*.tif,*.gif,.git,.svn,*.pdf,*.png,build,*.beam
" type of file that will not in wildmenu
set ruler               " show current position along the bottom
set cmdheight=2         " use 1 screen lines for command-line
"set nolazyredraw        " redraw while executing macros (for qbuf)
set lazyredraw        " redraw while executing macros (for qbuf)
set hidden              " allow to change buffer without saving
set backspace=2         " make backspace work normal
set whichwrap+=<,>,h,l  " allow backspace and cursor keys to wrap
set shortmess=atI       " shorten to avoid 'press a key' prompt
set report=0            " tell us when anything is changed via :...
set fillchars=vert:\ ,stl:\ ,stlnc:\
" make splitters between windows be blank
set showmatch           " show matching paren when a bracket inserted
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class,.lib,.exp,.pch,.res
set matchtime=2         " how many tenths of a second to blink
set ignorecase
set smartcase           " the case of normal letters is ignored except when upper is used
set hlsearch            " highlight all searched for phrases
set incsearch           " highlight where the typed pattern matches
set nu
set rnu
"set novisualbell        " use visual bell instead of beeping
set visualbell
set t_vb=
set noerrorbells        " do not make noise
if has("multi_byte_encoding")
    set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
else
    set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
endif
" how :set list show
set nolist
set magic               " set magic on
" set completeopt=menu    " use popup menu to show possible completions
" set foldenable          " enable folding, I find it very useful
set nofen               " enable folding, I find it very useful
"set foldmethod=syntax   " manual, marker, syntax, try set foldcolumn=2
set foldmethod=manual   " manual, marker, syntax, try set foldcolumn=2
" set laststatus=2        " always show the status line
" set statusline=\ %F%m%r%h\ %w\ %{&ff}\ \ now:\ %r%{CurDir()}%h\ \ \ pos:\ %l/%L:%c

" default 'statusline' with 'fileencoding'.
" let &statusline = ''
" let &statusline .= '%<%f %h%m%r%w'
" let &statusline .= '%='
" " " temporary disabled.
" " let &statusline .= '(%{' . s:SID_PREFIX() . 'vcs_branch_name(getcwd())}) '
" let &statusline .= '[%{&fileencoding == "" ? &encoding : &fileencoding}]'
" let &statusline .= '  %-14.(%l,%c%V%) %P'

set nomore              " more will fill the screen with project.vim
" format the statusline

" if has("gui_running")   " highlight cursor line/column
"   if v:version >= 700
"     hi CursorColumn guibg=#333333
"     " desert cursorline
"     highlight CursorLine term=none cterm=none ctermbg=8
"   endif
" endif

" if v:version >= 700     " popmenu color setting
"   hi Pmenu guibg=#333333
"   hi PmenuSel guibg=#555555 guifg=#ffffff
" endif
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Search: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from an idea by Michael Naumann
fu! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    else
        execute "normal /" . l:pattern . "^M"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endf

" press * or # to search for the current selection (part of word)
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving Around And Tabs: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map space to / and c-space to ?
"map <space> /
map <C-space> ?

" set H and L to first and last character of line
nnoremap H ^
nnoremap L $

" yank to end of line
nnoremap Y y$

" tag next prev
nmap <leader>tn :tn<cr>
nmap <leader>tp :tp<cr>

" To be able to undo these types of deletion in Insert mode.
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-u>  <C-g>u<C-u>


" " faster selection of tags
" map <C-\> :tselect /<C-R><C-W>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


"Vertical split then hop to new buffer
" noremap ,v :vsp<CR><C-W><C-W>

" smart way to close windows
map <leader>wc <C-W>c

" actually, the tab does not switch buffers, but my arrows
" bclose function can be found in "Buffer related" section
"map <leader>bd :Bclose<cr>
map <leader>bc :Bclose<cr>
map <leader>bd :Bclose<cr>
map <leader>bw :bw<cr>
" map <down> <esc>:Tlist<cr>
" use the arrows to do something useful
map <right> :bn<cr>
map <left> :bp<cr>
nnoremap <up> gk
nnoremap <down> gj

" tab configuration
" conflicts with stlref
"map <leader>tn :tabnew %<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
map <c-PageDown> :tabn<CR>
map <c-PageUp>   :tabp<CR>
"FIXME: disabled usetab
"try
"set switchbuf=usetab
"if has("gui_running") | set stal=1 | else | set stal=2 | endif
"catch
"endtry

" moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i

" imap <c-e> <esc>A
" imap <c-a> <esc>I

" switch to current dir
map <leader>cd :cd %:p:h<cr>
" }}}11

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis Bracket Expanding: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap z( <esc>`>a)<esc>`<i(<esc>
vnoremap z[ <esc>`>a]<esc>`<i[<esc>
vnoremap z{ <esc>`>a}<esc>`<i{<esc>
vnoremap z; <esc>`>a'<esc>`<i'<esc>
vnoremap z, <esc>`>a"<esc>`<i"<esc>

" Press {, (, [ and it will insert the corresponding {, (, [
"inoremap {{ {<cr>}<esc>kA<cr>
" inoremap {{ {<esc>o}<esc>:let leavechar="}"<cr>O
" inoremap (( ()<esc>:let leavechar=")"<cr>i
" inoremap [[ []<esc>:let leavechar="]"<cr>i
" inoremap ;; ''<esc>:let leavechar="'"<cr>i
" inoremap ,, ""<esc>:let leavechar='"'<cr>i


" map auto complete of (, [, {, ', "
inoremap z( ()<esc>:let leavechar=")"<cr>i
inoremap z[ []<esc>:let leavechar="]"<cr>i
inoremap z{ {}<esc>:let leavechar="}"<cr>i
inoremap z} {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap z; ''<esc>:let leavechar="'"<cr>i
inoremap z, ""<esc>:let leavechar='"'<cr>i

" auto match brackets
"inoremap { {<cr>}<esc>O <tab><esc>:let leavechar="}"<cr>i
"inoremap ( ()<esc>:let leavechar=")"<cr>i
"inoremap [ []<esc>:let leavechar="]"<cr>i
"imap <c-l> <esc>:exec "normal f" . leavechar<cr>a
"imap zz <esc>:exec "normal f" . leavechar<cr>a
"au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
"au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i


"autocmd Syntax xml,html,vim inoremap < <lt>><ESC>i|
" }}}1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
iab xname Reza Jelveh
"}}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing Mappings Etc: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap Vim 0
map 0 ^
map <A-i> i <esc>r

" edit text in quotes
nmap X ci"

" move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

fu! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endf
au BufWrite *.py :call DeleteTrailingWS()
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cmdline Settings: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! DeleteTillSlash()
    let g:cmd = getcmdline()
    if has("unix")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    endif
    if g:cmd == g:cmd_edited
        if has("unix")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        endif
    endif
    return g:cmd_edited
endf

fu! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endf

" smart mappings on the cmdline
cno `h e ~/
cno `j e ./

cno `q <C-\>eDeleteTillSlash()<cr>
cno `c e <C-\>eCurrentFileDir("e")<cr>

cno `tc <C-\>eCurrentFileDir("tabnew")<cr>
cno `th tabnew ~/

fu! CurrentWord(cmd)
    "return a:cmd . " /" . expand("<cword>") . "/ " . "*.h *.c *.cpp"
    return a:cmd . " " . expand("<cword>") . " " . "*.h *.c *.cpp"
endf
cno `v <C-\>eCurrentWord("Rgrep")<cr><Home><S-Right><Right><Right>
map <c-q> :`v

" bash like
cno <C-A> <Home>
cno <C-F> <Right>
cno <C-B> <Left>
cno <Esc>b <S-Left>
cno <Esc>f <S-Right>

" }}}1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer Related: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fast open a buffer by search for a name
"map <c-q> :sb
" open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

" restore cursor position in previous editing session, :h 'viminfo'
if (has("nvim"))
set viminfo='10,\"100,:20,!,n~/.viminfo-neovim
else
set viminfo='10,\"100,:20,!,n~/.viminfo
endif
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

nnoremap <F9> :TestNearest<cr>

" don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

fu! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif
    if bufnr("%") == l:currentBufNum
        enew
    endif
    if buflisted(l:currentBufNum)
        execute "bdelete! ".l:currentBufNum
    endif
endf
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Related: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle search highlighting
" map <silent> \ :let @/=""<cr><esc>
map <silent> \ :nohl<cr>
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files And Backups: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{1
set nobackup
if has("win32")
    set backupdir=$VIMDATA\backup
    set directory=$VIMDATA\temp
else
    set backupdir=$VIMDATA/backup
    set directory=$VIMDATA/temp
endif
"set nowritebackup
"set noswapfile
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell Checking: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => tovl grep
""""""""""""""""""""""""""""""
" command! -nargs=* BGgrep
" \ call tovl#plugin_management#Plugin('plugins#background_processes#grep#PluginBackgroundGrep').Dialog()


""""""""""""""""""""""""""""""
" => a.vim
""""""""""""""""""""""""""""""
map <silent> <leader>s :A<cr>


""""""""""""""""""""""""""""""
" => crefvim.vim
""""""""""""""""""""""""""""""
map <silent> <Leader>cc <Plug>CRV_CRefVimAsk
vmap <silent> <Leader>cr <Plug>CRV_CRefVimVisual
nmap <silent> <Leader>cr <Plug>CRV_CRefVimNormal


""""""""""""""""""""""""""""""
" => largefile.vim
""""""""""""""""""""""""""""""
let g:LargeFile = 3


""""""""""""""""""""""""""""""
" => tagbar.vim
""""""""""""""""""""""""""""""
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_type_coffee = {
            \ 'ctagstype' : 'coffee',
            \ 'kinds' : [
            \   'n:namespace',
            \   'c:class',
            \   'o:object',
            \   'm:methods',
            \   'f:functions',
            \   'i:instance variables',
            \   'v:var:1',
            \ ],
            \ 'sro' : ".",
            \ 'scope2kind' : {
            \   'o' : 'object',
            \   'f' : 'function',
            \   'm' : 'method',
            \   'v' : 'var',
            \   'i' : 'ivar'
            \ },
            \ 'kind2scope' : {
            \  'function' : 'f',
            \  'method' : 'm',
            \  'var' : 'v',
            \  'ivar' : 'i',
            \ 'object' : 'o'
            \}
            \}

let g:tagbar_type_css = {'ctagstype': 'CSS','kinds': ['c:classes', 's:selectors', 'i:identities'] }
" let g:tagbar_type_scss = {'ctagstype': 'scss','kinds': ['c:classes', 's:selectors', 'i:identities'] }
let g:tagbar_type_scss = {'ctagstype': 'CSS','kinds': ['c:classes', 's:selectors', 'i:identities'] }

autocmd QuickFixCmdPost *grep* cwindow



""""""""""""""""""""""""""""""
" => NERD_tree.vim
""""""""""""""""""""""""""""""
"noremap <C-E><C-E> :NERDTreeToggle<CR>
" if !has('nvim')
nmap <silent><F3> :NERDTreeToggle<cr>
imap <silent><F3> <C-O>:NERDTreeToggle<cr>
nmap <silent> \\ :execute 'NERDTreeToggle ' . fnameescape(getcwd())<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>
let g:NERDTreeHijackNetrw = 0
" else
"     nmap <silent> \\ :NvimTreeToggle<cr>
" endif


""""""""""""""""""""""""""""""
" => ctrlp.vim
""""""""""""""""""""""""""""""
" {{{
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~30%' }
" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" let g:rg_command = '
"             \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"             \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
"             \ -g "!{.git,node_modules,vendor}/*" '
let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '

" command! -bang -nargs=* FzfRg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

if has('nvim')
" Find files using Telescope command-line sugar.
nnoremap <leader>pf <cmd>Telescope find_files<cr>
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>hl <cmd>Telescope help_tags<cr>
nnoremap <silent><leader>fr :lua require('telescope').extensions.recent_files.pick()<CR>
" nnoremap <silent><leader>fr :Telescope frecency<CR>

" Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
else
noremap <f8> :FzfAg<CR>
noremap <silent> <leader>/ :FzfRg<CR>
noremap <silent> <leader>t :FzfFiles<CR>
noremap <silent> <leader>pf :FzfFiles<CR>
noremap <silent> <leader>bs :FzfBuffers<CR>
noremap <silent> <leader>tS :FzfColors<CR>
noremap <silent> <leader>gs :Gstatus<CR>
endif
noremap <silent> <leader>fr :FZFMru<CR>

" noremap <silent> <M-t> :CtrlP<CR>
" noremap <silent> <leader>t :CtrlP<CR>
" nnoremap <silent> <leader>T :ClearCtrlPCache<cr>\|:CtrlP<cr>
" noremap <silent> <leader>tb :CtrlPBuffer<CR>
" noremap <silent> <leader>m :CtrlPMRU<CR>
" nnoremap <silent> sz :CtrlPZ<Cr>
" nnoremap <silent> sf :CtrlPF<Cr>
" let g:ctrlp_z_nerdtree = 1
" let g:ctrlp_extensions = ['Z', 'F']
" let g:ctrlp_by_filename = 0
" let g:ctrlp_working_path_mode = 0

" let g:ctrlp_custom_ignore = {
"       \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.yardoc|output_.*py$|public|images|public\/system|public\/images|data|log|tmp|vendor\/bundle|bin|gen|target|node_modules)',
"       \ 'file': '\v\.(exe|so|dat|gem|class|dex)',
"       \ }
" \ 'link': 'some_bad_symbolic_links'
" }}}


""""""""""""""""""""""""""""""
" => gist.vim
""""""""""""""""""""""""""""""
if has("macunix")
    let g:gist_clip_command = 'pbcopy'
    " let g:ycm_path_to_python_interpreter = '/usr/bin/python'
elseif has("unix")
    let g:gist_clip_command = 'xclip -selection clipboard'
endif

""""""""""""""""""""""""""""""
" => xml.vim
""""""""""""""""""""""""""""""
let xml_tag_completion_map = "<C-l>"

""""""""""""""""""""""""""""""
" => vim-javascript.vim
""""""""""""""""""""""""""""""
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"


""""""""""""""""""""""""""""""
" => yankring.vim
""""""""""""""""""""""""""""""
map <leader>y :YRShow<cr>

nnoremap <F9>  :TestFile<cr>
" nnoremap <F10> :ToggleTerm<cr>
inoremap <F9>  <c-o>:TestFile<cr>
" inoremap <F10> <c-o>:ToggleTerm<cr>

""""""""""""""""""""""""""""""
" => session.vim
""""""""""""""""""""""""""""""
let g:session_autosave = 1
" let g:session_default_to_last = 1
" let g:session_autoload = 1


""""""""""""""""""""""""""""""
" => dbext.vim
""""""""""""""""""""""""""""""
let g:debext_default_type = 'MYSQL'
let g:dbext_default_profile_local_mysql = 'type=MYSQL:user=root:dbname=mysql=-t'
let g:dbext_default_MYSQL_bin = 'mysql'

""""""""""""""""""""""""""""""
" => jedi.vim
""""""""""""""""""""""""""""""
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0

""""""""""""""""""""""""""""""
" => javascript_libraries.vim
""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'underscore,backbone,jquery'


""""""""""""""""""""""""""""""
" => Others
""""""""""""""""""""""""""""""
" a.vim          - alternate files fast (.c -> .h)
" supertab.vim   - map <Tab> to SuperTab() function
" calendar.vim   - folder to store diary
let g:calendar_diary = $VIMDATA.'/diary'
" mru.vim        - file to save mru entries
let MRU_File = $VIMDATA.'/_vim_mru_files'
let MRU_Max_Entries = 20
" favmenu.vim    - file to save favorite items
let FAV_File = $VIMDATA.'/_vim_fav_files'
" doxygentoolkit.vim - map :Dox
map <leader>d :Dox<cr>
" doxygen.vim    - load doxygen syntax for c/cpp/idl
"let load_doxygen_syntax = 1
map <C-F11> :!/usr/bin/ctags -f tags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
map <C-F12> :%!astyle -t -b -S -w -M -p -U<cr>



""""""""""""""""""""""""""""""
" => latex
""""""""""""""""""""""""""""""
" {{{
let g:tex_fold_enabled = 1
let g:tex_flavor = "latex"
let g:tex_conceal = 'sgdm'
let g:tex_comment_nospell = 1
" }}}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => dwm {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" smart way to switch between windows
let g:dwm_map_keys = 0

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap <C-,> <Plug>DWMRotateCounterclockwise
nmap <C-N> <Plug>DWMNew
nmap <C-C> <Plug>DWMClose
nmap <C-_> <Plug>DWMShrinkMaster
nmap <C-+> <Plug>DWMGrowMaster


" inoremap <C-L> <C-P>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cope: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap + :cn<cr>
" nmap - :cp<cr>
nmap g+ :cnf<cr>
nmap g- :cpf<cr>
com! Cclear :cex[]
" map <leader>c :botright cw 10<cr>
" toggle quickfix
map <silent> <leader>` <ESC>:QFix<cr>
imap <silent> <leader>` <ESC>:QFix<cr>
"map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>
" close quickfix window with q
"au BufReadPost quickfix nmap q :bw<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Development
augroup development
    autocmd!
    " Fix auto-indentation for YAML files
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
    autocmd Filetype c,cpp setl nu cindent cino=(0 nowrap textwidth=0 ts=4 sw=4 sts=4 et
    autocmd Filetype objc,objcpp setl nu cindent cino=(0 nowrap textwidth=0 ts=4 sw=4 sts=4 et
    autocmd FileType make,php,sh,javascript,perl,css,dosbatch,python,xml,idlang setl nowrap textwidth=0
    autocmd FileType html,javascript setl cindent cino=J1 textwidth=0 ts=2 sw=2
    autocmd FileType haskell setl textwidth=0 ts=2 sw=2 sts=2 et
    "autocmd BufWritePost *.cpp,*.h,*.c call UpdateCTags()
    autocmd Filetype taglist setl statusline=Taglist
    autocmd FileType make set noet ts=8 sw=8 nosi
    autocmd FileType mkd set ai formatoptions=tcroqn2 comments=n:>
    au FileType vim setl sw=2 ts=2
    au FileType typescript setl sw=4 ts=4
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
    au FileType python setl tabstop=4 et sw=4 sts=4 nosi
    au FileType json setl tabstop=2 et sw=2 sts=2 nosi
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
    au BufRead,BufNewFile *.eco setl ft=eco.html sw=2 ts=2 et sts=2
    au BufRead,BufNewFile *.vra set ft=scope syntax=scope
    au BufRead,BufNewFile *.json.jbuilder set ft=ruby
    au BufNewFile,BufRead *.gradle setf groovy
    " Vala/Genie Support -------------------------------- {{{
    " get vala.vim here:
    " https://live.gnome.org/Vala/Vim
    autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    autocmd BufRead,BufNewFile *.vala setl et ts=4 sts=4 sw=4 nu cindent cino=(0 filetype=vala
    autocmd BufRead,BufNewFile *.vapi setl et ts=4 sts=4 sw=4 nu cindent cino=(0 filetype=vala
    autocmd FileType vala setlocal cindent

    " indentation for genie: genie.vim
    " http://www.vim.org/scripts/script.php?script_id=2349
    " This will overrule the default filetype grads
    autocmd BufRead,BufNewFile *.gs setlocal filetype=genie

    autocmd FileType vala,genie setlocal formatoptions+=croql
    " }}}

    " Python Support ------------------------------------ {{{
    autocmd FileType python inoreab <buffer> #! #!/usr/bin/env python
    autocmd FileType python inoreab <buffer> #e # -*- coding: utf=8 -*-
    " }}}

    " templates {{{
    autocmd BufNewFile  proguard.cfg        :r ~/.vim/skeletons/proguard.cfg
    autocmd BufNewFile  *Activity.java      :r ~/.vim/skeletons/activity.java
    autocmd BufNewFile  *.jbuilder          :r ~/.vim/skeletons/json.jbuilder
    autocmd BufNewFile  PKGBUILD            :r ~/.vim/skeletons/PKGBUILD
    autocmd BufNewFile  *.textile           :r ~/.vim/skeletons/blogpost.textile
    " }}}

    autocmd FileType snippets setl noet

augroup END

augroup TEXT
    " Allows to read PDF files with VIM by piping them through pdftotext
    autocmd BufReadPre *.pdf set ro
    autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78

    " Same for word files with antiword
    autocmd BufReadPre *.doc set ro
    autocmd BufReadPost *.doc %!antiword "%"

    autocmd BufReadPre *.docx set ro
    autocmd BufReadPost *.docx %!antiword-xp "%"
augroup END

augroup PASS
    au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
    au BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile
    au BufNewFile,BufRead /dev/shm/pass.* setlocal noswapfile nobackup noundofile
    au BufNewFile,BufRead /private/**/pass** setlocal noswapfile nobackup noundofile
augroup END

" this allows us to write to files even when we
" forget to use sudo to launch vim
if has('nvim')
  command! -bar -nargs=0 Sudow :SudaWrite<cr>
else
  command! -bar -nargs=0 Sudow :silent exe "w !sudo tee % > /dev/null" | silent edit!
endif


" use jk for esc
" imap jk <Esc>

" go to newline
imap <M-o> <Esc>o

" convert last word to uppercase
imap <c--> <esc>gUiw`]a
" doesnt work in Terminal.app otherwise
imap <c-_> <esc>gUiw`]a

if has('gui_macvim')
    " ---------------------------
    " Some Window Settings
    " ---------------------------
    map <D-left> <c-W><left>
    map <D-up> <c-W><up>
    map <D-down> <c-W><down>
    map <D-right> <c-W><right>
    map <D-=> <c-W>+
    map <D--> <c-W>-
    map <D-S-w> <c-W>c

    " ---------------------------------
    " mimic some of textmates behavior
    " ---------------------------------
    " command enter
    imap <D-cr> <c-o>o
    " command shift enter
    imap <D-S-cr> <c-o>o
    imap <D-A-cr> <c-o>o
    autocmd FileType c,cpp,objc,objcpp,php imap <D-S-cr> <ESC>A;<ESC>o
    autocmd FileType c,cpp,objc,objcpp,php imap <D-A-cr> <ESC>A;<ESC>
    let g:hlrainbow = "[]"
    " autocmd set tabstop=2 shiftwidth=2
    imap <D-]> <C-T>
    imap <D-#> <C-T>
    imap <D-[> <C-D>
    imap <D-!> <C-D>
    " show files
    nmap <D-t> :e **/
else
    map <M-left> <c-W><left>
    map <M-up> <c-W><up>
    map <M-down> <c-W><down>
    map <M-right> <c-W><right>
endif

" toggle folds with space
nnoremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'1')<cr>
" create fold in visual mode
vnoremap <space> zf
" Toggle fold state between closed and opened.
"
"nnoremap <space> :call ToggleFold()<CR>
" this fold hotkey will go one character left after folding
"nnoremap <silent> <Space> :exe 'silent! normal! za'.(foldlevel('.')?'h':'')<CR>
"map <space> <c-f>
"map <S-space> <c-b>
"map <Space><Space> <c-W>W<c-W>_
"nmap <S-space> :
"imap <S-space> <Esc>

"set foldlevel=1
inoremap <C-G> <Esc>gUiw`]a

" xml
let g:xml_use_xhtml = 1
let g:xml_use_html = 1

let g:rails_default_database="mysql"


" jump to line at cursor
map <F5> [I:let nr = input("Which one: ") <Bar>exe "normal " . nr ."[\t"<CR>

" remove the windows ^M
noremap <leader>dos mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''


function! ToggleSuperpaste()
    if exists("g:superpaste_on")
        unlet g:superpaste_on
        iunmap <C-V>
        vunmap <C-C>
    else
        let g:superpaste_on = 1
        " super paste
        inoremap <C-V> <esc>:set paste<cr>mua<C-R>+<esc>mv'uV'v=:set nopaste<cr>
        " copy into clipboard
        vnoremap <C-C> "+y
    endif
endfunction

call ToggleSuperpaste()

" select range, hit :call SuperRetab($width) - by p0g and FallingCow
fu! SuperRetab(width) range
    sil! exe a:firstline.','.a:lastline.'s/\v%(^ *)@<= {'. a:width .'}/\t/g'
endf

" ------------------------
" Change Working Directory: {{{1
" -----------------------

"function! CHANGE_CURR_DIR()
"let _dir = expand("%:p:h")
"if _dir !~ '^/tmp'
"exec "cd %:p:h"
"endif
"unlet _dir
"endfunction

"autocmd BufEnter * call CHANGE_CURR_DIR()


if has("win32")
    " windows ddk, driver develop kit
    set makeprg=for\ \%c\ in\ (\"pushd\ .\"\ \"setenv\ D:\\foo\\WINDDK\\2600\ chk\"\ \"popd\"\ \"build\ -cZ\"\ \"copy\ i386\\ds30xx.sys\ e:\\work\\X\\i386\")\ do\ call\ \%~c
endif



autocmd BufEnter PKGBUILD,.env
            \   let b:ale_sh_shellcheck_exclusions = 'SC2034,SC2154,SC2164'


set packpath+=~/.vim/pack
"if filereadable($VIMDATA."/session.vim")
"  au VimEnter * so $VIMDATA/session.vim
"endif
"au VimLeavePre * mks! $VIMDATA/session.vim
" don't load the python stuff as root, i.e. sudo

let g:LanguageClient_serverCommands = {
      \ 'rust': ['rls'],
      \ 'python': ['poetry', 'run', 'pyls'],
      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
      \ 'ruby': ['solargraph', 'stdio'],
      \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
      \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
      \ }



if executable('pyls')
  " pip install python-language-server
  au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['poetry run pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
" let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
" let g:lsp_signs_enabled = 1         " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set et ft=vim tw=78 path+=$VIMFILES/* tags+=$VIMRUNTIME/doc/tags:

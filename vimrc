""""built-in settings""""

let g:python3_host_prog = '/usr/bin/python3.8'

"change leader key
let mapleader = ","

"use system clipboard
set clipboard=unnamedplus

"color setting
if (has("termguicolors"))
  set termguicolors
endif

"highlight the column past the width limit (usually 80)
set colorcolumn=81

"make tab show up red. To replace tab with spaces, use :retab.
syn match tab display "\t"
hi link tab Error

"undo persistence
set undodir=~/.vim/undo
set undofile

syntax on
set nocompatible
set backspace=indent,eol,start
set nu
set ruler
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch            " highlight matches
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals

set autoindent
set smarttab
set expandtab
set shiftwidth=2

""map dd to deleteing (yanking to black hole register)
nnoremap d "_d
vnoremap d "_d

"auto formatting
function! ClangFormatonsave()
  let l:formatdiff = 1
  pyf /usr/local/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp,*.c call ClangFormatonsave()

""""install plugins""""
call plug#begin('~/.vim/plugged')
    Plug 'flazz/vim-colorschemes'
    Plug 'scrooloose/nerdcommenter'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-obsession'
    Plug 'nacitar/a.vim'
    Plug 'rhysd/vim-clang-format'
    Plug 'ojroques/vim-oscyank'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'theHamsta/nvim-treesitter-pairs'
    Plug 'rust-lang/rust.vim'
call plug#end()


""""plugin settings""""

"rust-vim"
let g:rustfmt_autosave = 1

"vim-oscyank
vnoremap <leader>y :OSCYank<CR>

"color schemes
set background=dark
lua << EOF
require('nightfox').setup({
  options = {
    transparent = true,
  }
})
EOF
colorscheme nordfox

"python highlight
let python_highlight_all=1

"vim-obsession
nnoremap <leader>os :Obsess<CR>

"a.vim
map <C-a> :A<CR>

""fzf-vim
let g:fzf_history_dir = '~/.fzf-history'
let g:fzf_preview_window = ['up:50%:wrap', 'ctrl-/']

" Rg searches file content only (default includes file name)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:50%:wrap', 'ctrl-/'), <bang>0)
" Rg search cursor word
command! -bang -nargs=* RgCursor call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(expand('<cword>')), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:50%:wrap', 'ctrl-/'), <bang>0)

nnoremap <leader>ff :Files!<cr>
nnoremap <leader>fg :Rg!<cr>
nnoremap <leader>fG :RgCursor!<cr>
" Rg search visual mode
vnoremap <leader>fg y:exec 'Rg! '. escape(@", '/\()[]{}?.')<CR>
nnoremap <leader>fb :Buffers!<cr>
nnoremap <leader>fh :History!<cr>

"nvim-lspconfig
lua << EOF
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
  })

  function PrintDiagnostics(opts, bufnr, line_nr, client_id)
    opts = opts or {}

    bufnr = bufnr or 0
    line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)

    local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
    if vim.tbl_isempty(line_diagnostics) then return end

    local diagnostic_message = ""
    for i, diagnostic in ipairs(line_diagnostics) do
      diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
      print(diagnostic_message)
      if i ~= #line_diagnostics then
        diagnostic_message = diagnostic_message .. "\n"
      end
    end
    vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
  end

--  vim.cmd [[ autocmd CursorHold * lua PrintDiagnostics() ]]

  -- You will likely want to reduce updatetime which affects CursorHold
  -- note: this setting is global and should be set only once
--  vim.o.updatetime = 500
--  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

EOF

nnoremap <leader>ld :lua PrintDiagnostics()<CR>

""nvim-cmp
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'path' },
      { 
        name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end
        }
      },
    }
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this wont work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this wont work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


  -- Setup lspconfig.
  local nvim_lsp = require'lspconfig'
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  nvim_lsp.ccls.setup {
    capabilities = capabilities,
    init_options = {
      highlight = {
        lsRanges = true;
      },
      cache = {
        directory = ".ccls-cache";
      }
    }
  }

  nvim_lsp.rust_analyzer.setup {
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern("rust-project.json"),
    settings = {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
              group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
              enable = true,
          },
        },
        procMacro = {
          enable = true
        },
      }
    }
  }


  -- Setup treesitter.
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {
      enable = true,              -- false will disable the whole extension
      disable = {},  -- list of language that will be disabled
      additional_vim_regex_highlighting = false,
    },
    -- Setup nvim-treesitter-pairs
    pairs = {
      enable = true,
      disable = {},
      highlight_pair_events = {"CursorMoved"}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
      highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
      goto_right_end = false, -- whether to go to the end of the right partner or the beginning
      fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
      keymaps = {
        goto_partner = "%",
        delete_balanced = "X",
      },
      delete_balanced = {
        only_on_first_char = true, -- whether to trigger balanced delete when on first character of a pair
        fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
        longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
                                 -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
      }
    },
  }
EOF

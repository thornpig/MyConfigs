-- (c) Meta Platforms, Inc. and affiliates. Confidential and proprietary.

-- @lint-ignore-every LUA_LUAJIT

-- Bootstrap Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data")
      .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    -- For some reason, Lua's RTP might not update with the above command so we
    -- have to force update it.
    vim.cmd([[let &runtimepath = &runtimepath]])
    return true
  end
  return false
end

PACKER_BOOTSTRAP = ensure_packer()

-- Run PackerCompile whenever we edit this file with `nvim`.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- OSC52 clipboard
  use({
    "ojroques/nvim-osc52",
    config = function()
      local function copy(lines, _)
        require('osc52').copy(table.concat(lines, '\n'))
      end

      local function paste()
        return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
      end

      vim.g.clipboard = {
        name = 'osc52',
        copy = { ['+'] = copy, ['*'] = copy },
        paste = { ['+'] = paste, ['*'] = paste },
      }

      -- Now the '+' register will copy to system clipboard using OSC52
      vim.keymap.set('n', '<leader>y', '"+y')
      vim.keymap.set('n', '<leader>yy', '"+yy')
    end
  })

  -- switch between source and header
  use({
    "nacitar/a.vim",
    config = function()
      vim.keymap.set('', '<C-a>', ':A<CR>', { noremap = true, silent = true })
    end
  })

  -- Colorscheme
  use({
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        }
      })
      vim.cmd("colorscheme nordfox")
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    config = function()
      require 'lspconfig'.lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }
    end
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.install").command_extra_args = {
        curl = { "--proxy", "http://fwdproxy:8080" },
      }

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "c_sharp",
          "cmake",
          "comment",
          "cpp",
          "css",
          "cuda",
          "erlang",
          "fish",
          "gitattributes",
          "go",
          "graphql",
          "hack",
          "haskell",
          "hcl",
          "hjson",
          "html",
          "http",
          "java",
          "javascript",
          "jsdoc",
          "json",
          "json5",
          "jsonc",
          "kotlin",
          "latex", "llvm",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "ocaml",
          "ocaml_interface",
          "perl",
          "php",
          "python",
          "query",
          "regex",
          "ruby",
          "rust",
          "sql",
          "tlaplus",
          "toml",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        highlight = {
          enable = true,
          disable = { "latex" },
        },
        indent = {
          enable = true,
          disable = { "python", "lua", "latex" },
        },
      })
    end,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use("L3MON4D3/LuaSnip")

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
    },
    after = "LuaSnip",
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
          }),
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = 'path' },
          {
            name = 'buffer',
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end
            }
          },
        },
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
    end,
  })

  use({
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp",
  })

  use({
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("nvim-autopairs").setup({})

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
      )
    end,
  })

  use({
    "ibhagwan/fzf-lua",
    config = function()
      -- rg --files is much faster than fd for large & deep directories
      vim.keymap.set('n', '<leader>ff',
        function()
          require('fzf-lua').files({ cmd = "rg --files" })
        end, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fF', require('fzf-lua').files, { noremap = true, silent = true }) -- use default file listing command
      vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fk', require('fzf-lua').builtin, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fh', require('fzf-lua').search_history, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fg', require('fzf-lua').live_grep_glob, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fG', require('fzf-lua').grep_cword, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fr', require('fzf-lua').resume, { noremap = true, silent = true })
      vim.keymap.set('v', '<leader>fg', require('fzf-lua').grep_visual, { noremap = true, silent = true })

      require('fzf-lua').setup {
        winopts = {
          preview = { vertical = 'up:60%', wrap = 'wrap' },
        },
        files = {
          fzf_opts = {
            ['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-files-history',
          },
        },
        grep = {
          fzf_opts = {
            ['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-grep-history',
          },
        }
      }
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Allow multi select https://github.com/nvim-telescope/telescope.nvim/issues/1048
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      local custom_actions = {}

      function custom_actions._multiopen(prompt_bufnr, open_cmd)
        local picker = action_state.get_current_picker(prompt_bufnr)
        local num_selections = #picker:get_multi_selection()
        if num_selections > 1 then
          local cwd = picker.cwd
          if cwd == nil then
            cwd = ""
          else
            cwd = string.format("%s/", cwd)
          end
          vim.cmd("bw!") -- wipe the prompt buffer
          for _, entry in ipairs(picker:get_multi_selection()) do
            vim.cmd(string.format("%s %s%s", open_cmd, cwd, entry.value))
          end
          vim.cmd("stopinsert")
        else
          if open_cmd == "vsplit" then
            actions.file_vsplit(prompt_bufnr)
          elseif open_cmd == "split" then
            actions.file_split(prompt_bufnr)
          elseif open_cmd == "tabe" then
            actions.file_tab(prompt_bufnr)
          else
            actions.select_default(prompt_bufnr)
          end
        end
      end

      function custom_actions.multi_selection_open_vsplit(prompt_bufnr)
        custom_actions._multiopen(prompt_bufnr, "vsplit")
      end

      function custom_actions.multi_selection_open_split(prompt_bufnr)
        custom_actions._multiopen(prompt_bufnr, "split")
      end

      function custom_actions.multi_selection_open_tab(prompt_bufnr)
        custom_actions._multiopen(prompt_bufnr, "tabe")
      end

      function custom_actions.multi_selection_open(prompt_bufnr)
        custom_actions._multiopen(prompt_bufnr, "edit")
      end

      require("telescope").setup({
        defaults = {
          previewer = true,
          path_display = { "smart" },
          layout_strategy = "vertical",
          layout_config = {
            horizontal = {
              preview_cutoff = 0,
            },
          },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<tab>"] = actions.toggle_selection
                  + actions.move_selection_next,
              ["<s-tab>"] = actions.toggle_selection
                  + actions.move_selection_previous,
              ["<cr>"] = custom_actions.multi_selection_open,
              ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
              ["<c-s>"] = custom_actions.multi_selection_open_split,
              ["<c-t>"] = custom_actions.multi_selection_open_tab,
            },
            n = {
              ["<esc>"] = actions.close,
              ["<tab>"] = actions.toggle_selection
                  + actions.move_selection_next,
              ["<s-tab>"] = actions.toggle_selection
                  + actions.move_selection_previous,
              ["<cr>"] = custom_actions.multi_selection_open,
              ["<c-v>"] = custom_actions.multi_selection_open_vsplit,
              ["<c-s>"] = custom_actions.multi_selection_open_split,
              ["<c-t>"] = custom_actions.multi_selection_open_tab,
            },
          },
        },
      })

      vim.keymap.set('n', '<leader>tg', require('telescope.builtin').live_grep, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>tG', require('telescope.builtin').grep_string, { noremap = true, silent = true })
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tb",
        [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tf",
        [[<cmd>lua require('telescope.builtin').find_files({layout_strategy='vertical'})<CR>]],
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tz",
        [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
        { noremap = true, silent = true }
      )

      -- wrap lines in previewer
      vim.cmd([[autocmd User TelescopePreviewerLoaded setlocal wrap]])
    end,
  })

  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    after = "telescope.nvim",
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      }
      require('telescope').load_extension('fzf')
    end
  })

  use({
    "folke/trouble.nvim",
    config = function()
      require('trouble').setup {
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
          -- icons / text used for a diagnostic
          error = "error",
          warning = "warn",
          hint = "hint",
          information = "info"
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
      }
    end
  })

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use("tpope/vim-surround")

  use("tpope/vim-repeat")

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        char = "┊",
        filetype_exclude = { "help", "packer" },
        buftype_exclude = { "terminal", "nofile" },
        char_highlight = "LineNr",
        show_trailing_blankline_indent = false,
      })
    end,
  })

  use({ "/usr/share/fb-editor-support/nvim", as = "meta.nvim" })

  use({
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      })
    end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

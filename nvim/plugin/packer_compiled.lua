-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/zackzhu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/zackzhu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/zackzhu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/zackzhu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/zackzhu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["a.vim"] = {
    config = { "\27LJ\2\n\\\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\v:A<CR>\n<C-a>\5\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/a.vim",
    url = "https://github.com/nacitar/a.vim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nî\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\5\0\0\a~/\15~/Projects\16~/Downloads\6/\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/zackzhu/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["fzf-lua"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\bcmd\15rg --files\nfiles\ffzf-lua\frequire∞\b\1\0\b\0003\0É\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0006\4\b\0'\6\t\0B\4\2\0029\4\n\0045\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\f\0006\4\b\0'\6\t\0B\4\2\0029\4\r\0045\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\15\0006\4\b\0'\6\t\0B\4\2\0029\4\16\0045\5\17\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\18\0006\4\b\0'\6\t\0B\4\2\0029\4\19\0045\5\20\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\21\0006\4\b\0'\6\t\0B\4\2\0029\4\22\0045\5\23\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\24\0006\4\b\0'\6\t\0B\4\2\0029\4\25\0045\5\26\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\27\0006\4\b\0'\6\t\0B\4\2\0029\4\28\0045\5\29\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\30\0'\3\21\0006\4\b\0'\6\t\0B\4\2\0029\4\31\0045\5 \0B\0\5\0016\0\b\0'\2\t\0B\0\2\0029\0!\0005\2%\0005\3#\0005\4\"\0=\4$\3=\3&\0025\3-\0005\4+\0006\5\0\0009\5'\0059\5(\5'\a)\0B\5\2\2'\6*\0&\5\6\5=\5,\4=\4.\3=\3\n\0025\0031\0005\0040\0006\5\0\0009\5'\0059\5(\5'\a)\0B\5\2\2'\6/\0&\5\6\5=\5,\4=\4.\3=\0032\2B\0\2\1K\0\1\0\tgrep\1\0\0\1\0\0\26/fzf-lua-grep-history\rfzf_opts\1\0\0\14--history\1\0\0\27/fzf-lua-files-history\tdata\fstdpath\afn\fwinopts\1\0\0\fpreview\1\0\0\1\0\2\rvertical\vup:60%\twrap\twrap\nsetup\1\0\2\fnoremap\2\vsilent\2\16grep_visual\6v\1\0\2\fnoremap\2\vsilent\2\vresume\15<leader>fr\1\0\2\fnoremap\2\vsilent\2\15grep_cword\15<leader>fG\1\0\2\fnoremap\2\vsilent\2\19live_grep_glob\15<leader>fg\1\0\2\fnoremap\2\vsilent\2\19search_history\15<leader>fh\1\0\2\fnoremap\2\vsilent\2\fbuiltin\15<leader>fk\1\0\2\fnoremap\2\vsilent\2\fbuffers\15<leader>fb\1\0\2\fnoremap\2\vsilent\2\nfiles\ffzf-lua\frequire\15<leader>fF\1\0\2\fnoremap\2\vsilent\2\0\15<leader>ff\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nŸ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\3\0\0\thelp\vpacker\1\0\3#show_trailing_blankline_indent\1\19char_highlight\vLineNr\tchar\b‚îä\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["meta.nvim"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/meta.nvim",
    url = "/usr/share/fb-editor-support/nvim"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\2\nâ\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\24colorscheme nordfox\bcmd\bvim\foptions\1\0\0\1\0\1\16transparent\2\nsetup\rnightfox\frequire\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n‹\1\0\0\n\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "cmp_luasnip" },
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\0¿\tbody\15lsp_expandö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\0¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\0¿\tjump\rjumpable\21select_prev_item\fvisible.\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19nvim_list_bufs\bapi\bvimÔ\6\1\0\v\0007\0k6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0029\2\a\0015\4\v\0005\5\t\0003\6\b\0=\6\n\5=\5\f\0045\5\15\0009\6\r\0019\6\14\6B\6\1\2=\6\16\0059\6\r\0019\6\17\6B\6\1\2=\6\18\0059\6\r\0019\6\19\6)\b¸ˇB\6\2\2=\6\20\0059\6\r\0019\6\19\6)\b\4\0B\6\2\2=\6\21\0059\6\r\0019\6\22\6B\6\1\2=\6\23\0059\6\r\0019\6\24\6B\6\1\2=\6\25\0059\6\r\0019\6\26\0065\b\29\0009\t\27\0019\t\28\t=\t\30\bB\6\2\2=\6\31\0053\6 \0=\6!\0053\6\"\0=\6#\5=\5\r\0044\5\5\0005\6$\0>\6\1\0055\6%\0>\6\2\0055\6&\0>\6\3\0055\6'\0005\a)\0003\b(\0=\b*\a=\a+\6>\6\4\5=\5,\4B\2\2\0019\2\a\0019\2-\0025\4.\0005\0050\0009\6\r\0019\6/\0069\6-\6B\6\1\2=\6\r\0054\6\3\0005\a1\0>\a\1\6=\6,\5B\2\3\0019\2\a\0019\2-\2'\0042\0005\0053\0009\6\r\0019\6/\0069\6-\6B\6\1\2=\6\r\0059\0064\0019\6,\0064\b\3\0005\t5\0>\t\1\b4\t\3\0005\n6\0>\n\1\tB\6\3\2=\6,\5B\2\3\0012\0\0ÄK\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\1\3\0\0\6/\6?\fcmdline\fsources\voption\15get_bufnrs\1\0\0\0\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n≤\2\0\0\n\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\22\0005\3\20\0005\4\5\0005\5\4\0=\5\6\0045\5\b\0005\6\a\0=\6\t\5=\5\n\0045\5\15\0006\6\v\0009\6\f\0069\6\r\6'\b\14\0+\t\2\0B\6\3\2=\6\16\5=\5\17\0045\5\18\0=\5\19\4=\4\21\3=\3\23\2B\0\2\1K\0\1\0\rsettings\1\0\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\nsetup\vlua_ls\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-osc52"] = {
    config = { "\27LJ\2\nU\0\2\b\0\6\0\v6\2\0\0'\4\1\0B\2\2\0029\2\2\0026\4\3\0009\4\4\4\18\6\0\0'\a\5\0B\4\3\0A\2\0\1K\0\1\0\6\n\vconcat\ntable\tcopy\nosc52\frequire{\0\0\6\0\a\1\0194\0\3\0006\1\0\0009\1\1\0019\1\2\0016\3\0\0009\3\1\0039\3\3\3'\5\4\0B\3\2\2'\4\5\0B\1\3\2>\1\1\0006\1\0\0009\1\1\0019\1\6\1'\3\4\0B\1\2\0?\1\0\0L\0\2\0\15getregtype\6\n\5\vgetreg\nsplit\afn\bvim\5ÄÄ¿ô\4€\1\1\0\a\0\19\0\0293\0\0\0003\1\1\0006\2\2\0009\2\3\0025\3\5\0005\4\6\0=\0\a\4=\0\b\4=\4\t\0035\4\n\0=\1\a\4=\1\b\4=\4\v\3=\3\4\0026\2\2\0009\2\f\0029\2\r\2'\4\14\0'\5\15\0'\6\16\0B\2\4\0016\2\2\0009\2\f\0029\2\r\2'\4\14\0'\5\17\0'\6\18\0B\2\4\1K\0\1\0\t\"+yy\15<leader>yy\b\"+y\14<leader>y\6n\bset\vkeymap\npaste\1\0\0\tcopy\6*\6+\1\0\0\1\0\1\tname\nosc52\14clipboard\6g\bvim\0\0\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/nvim-osc52",
    url = "https://github.com/ojroques/nvim-osc52"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n˙\4\0\0\5\0\18\0\0246\0\0\0'\2\1\0B\0\2\0025\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\0\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0005\4\f\0=\4\r\3=\3\14\0025\3\15\0005\4\16\0=\4\r\3=\3\17\2B\0\2\1K\0\1\0\vindent\1\4\0\0\vpython\blua\nlatex\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\1\venable\2\21ensure_installed\1\0\0\0011\0\0\tbash\6c\fc_sharp\ncmake\fcomment\bcpp\bcss\tcuda\verlang\tfish\18gitattributes\ago\fgraphql\thack\fhaskell\bhcl\nhjson\thtml\thttp\tjava\15javascript\njsdoc\tjson\njson5\njsonc\vkotlin\nlatex\tllvm\blua\tmake\rmarkdown\20markdown_inline\nocaml\20ocaml_interface\tperl\bphp\vpython\nquery\nregex\truby\trust\bsql\ftlaplus\ttoml\15typescript\bvim\vvimdoc\tyaml\nsetup\28nvim-treesitter.configs\tcurl\1\0\0\1\3\0\0\f--proxy\25http://fwdproxy:8080\23command_extra_args\28nvim-treesitter.install\frequire\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\n’\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nsetup\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzf-native.nvim" },
    config = { "\27LJ\2\n‚\3\0\2\18\2\21\0K-\2\0\0009\2\0\2\18\4\0\0B\2\2\2\18\5\2\0009\3\1\2B\3\2\2\21\3\3\0)\4\1\0\1\4\3\0X\4&Ä9\4\2\2\v\4\0\0X\5\2Ä'\4\3\0X\5\6Ä6\5\4\0009\5\5\5'\a\6\0\18\b\4\0B\5\3\2\18\4\5\0006\5\a\0009\5\b\5'\a\t\0B\5\2\0016\5\n\0\18\t\2\0009\a\1\2B\a\2\0A\5\0\4X\b\nÄ6\n\a\0009\n\b\n6\f\4\0009\f\5\f'\14\v\0\18\15\1\0\18\16\4\0009\17\f\tB\f\5\0A\n\0\1E\b\3\3R\bÙ\1276\5\a\0009\5\b\5'\a\r\0B\5\2\1X\4\25Ä\a\1\14\0X\4\5Ä-\4\1\0009\4\15\4\18\6\0\0B\4\2\1X\4\18Ä\a\1\16\0X\4\5Ä-\4\1\0009\4\17\4\18\6\0\0B\4\2\1X\4\vÄ\a\1\18\0X\4\5Ä-\4\1\0009\4\19\4\18\6\0\0B\4\2\1X\4\4Ä-\4\1\0009\4\20\4\18\6\0\0B\4\2\1K\0\1\0\1¿\0¿\19select_default\rfile_tab\ttabe\15file_split\nsplit\16file_vsplit\vvsplit\15stopinsert\nvalue\f%s %s%s\vipairs\bbw!\bcmd\bvim\b%s/\vformat\vstring\5\bcwd\24get_multi_selection\23get_current_picker3\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2¿\vvsplit\15_multiopen2\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2¿\nsplit\15_multiopen1\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2¿\ttabe\15_multiopen1\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2¿\tedit\15_multiopen∏\v\1\0\v\0B\0Å\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0024\2\0\0003\3\4\0=\3\3\0023\3\6\0=\3\5\0023\3\b\0=\3\a\0023\3\n\0=\3\t\0023\3\f\0=\3\v\0026\3\0\0'\5\r\0B\3\2\0029\3\14\0035\5)\0005\6\15\0005\a\16\0=\a\17\0065\a\19\0005\b\18\0=\b\20\a=\a\21\0065\a$\0005\b\23\0009\t\22\0=\t\24\b9\t\25\0=\t\26\b9\t\27\0=\t\28\b9\t\29\0009\n\25\0 \t\n\t=\t\30\b9\t\29\0009\n\27\0 \t\n\t=\t\31\b9\t\v\2=\t \b9\t\5\2=\t!\b9\t\a\2=\t\"\b9\t\t\2=\t#\b=\b%\a5\b&\0009\t\22\0=\t\24\b9\t\29\0009\n\25\0 \t\n\t=\t\30\b9\t\29\0009\n\27\0 \t\n\t=\t\31\b9\t\v\2=\t \b9\t\5\2=\t!\b9\t\a\2=\t\"\b9\t\t\2=\t#\b=\b'\a=\a(\6=\6*\5B\3\2\0016\3+\0009\3,\0039\3-\3'\5'\0'\6.\0006\a\0\0'\t/\0B\a\2\0029\a0\a5\b1\0B\3\5\0016\3+\0009\3,\0039\3-\3'\5'\0'\0062\0006\a\0\0'\t/\0B\a\2\0029\a3\a5\b4\0B\3\5\0016\3+\0009\0035\0039\0036\3'\5'\0'\0067\0'\a8\0005\b9\0B\3\5\0016\3+\0009\0035\0039\0036\3'\5'\0'\6:\0'\a;\0005\b<\0B\3\5\0016\3+\0009\0035\0039\0036\3'\5'\0'\6=\0'\a>\0005\b?\0B\3\5\0016\3+\0009\3@\3'\5A\0B\3\2\0012\0\0ÄK\0\1\0008autocmd User TelescopePreviewerLoaded setlocal wrap\bcmd\1\0\2\fnoremap\2\vsilent\2J<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>\15<leader>tz\1\0\2\fnoremap\2\vsilent\2W<cmd>lua require('telescope.builtin').find_files({layout_strategy='vertical'})<CR>\15<leader>tf\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').buffers()<CR>\15<leader>tb\20nvim_set_keymap\bapi\1\0\2\fnoremap\2\vsilent\2\16grep_string\15<leader>tG\1\0\2\fnoremap\2\vsilent\2\14live_grep\22telescope.builtin\15<leader>tg\bset\vkeymap\bvim\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<c-t>\n<c-s>\n<c-v>\t<cr>\f<s-tab>\n<tab>\21toggle_selection\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\18layout_config\15horizontal\1\0\0\1\0\1\19preview_cutoff\3\0\17path_display\1\2\0\0\nsmart\1\0\2\20layout_strategy\rvertical\14previewer\2\nsetup\14telescope\0\25multi_selection_open\0\29multi_selection_open_tab\0\31multi_selection_open_split\0 multi_selection_open_vsplit\0\15_multiopen\28telescope.actions.state\22telescope.actions\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n∆\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\4\nerror\nerror\thint\thint\16information\tinfo\fwarning\twarn\1\0\5\14fold_open\6v\nicons\1\17indent_lines\1\25use_diagnostic_signs\1\16fold_closed\6>\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/zackzhu/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n˙\4\0\0\5\0\18\0\0246\0\0\0'\2\1\0B\0\2\0025\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\0\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0005\4\f\0=\4\r\3=\3\14\0025\3\15\0005\4\16\0=\4\r\3=\3\17\2B\0\2\1K\0\1\0\vindent\1\4\0\0\vpython\blua\nlatex\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\1\venable\2\21ensure_installed\1\0\0\0011\0\0\tbash\6c\fc_sharp\ncmake\fcomment\bcpp\bcss\tcuda\verlang\tfish\18gitattributes\ago\fgraphql\thack\fhaskell\bhcl\nhjson\thtml\thttp\tjava\15javascript\njsdoc\tjson\njson5\njsonc\vkotlin\nlatex\tllvm\blua\tmake\rmarkdown\20markdown_inline\nocaml\20ocaml_interface\tperl\bphp\vpython\nquery\nregex\truby\trust\bsql\ftlaplus\ttoml\15typescript\bvim\vvimdoc\tyaml\nsetup\28nvim-treesitter.configs\tcurl\1\0\0\1\3\0\0\f--proxy\25http://fwdproxy:8080\23command_extra_args\28nvim-treesitter.install\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nŸ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\3\0\0\thelp\vpacker\1\0\3#show_trailing_blankline_indent\1\19char_highlight\vLineNr\tchar\b‚îä\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n≤\2\0\0\n\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\22\0005\3\20\0005\4\5\0005\5\4\0=\5\6\0045\5\b\0005\6\a\0=\6\t\5=\5\n\0045\5\15\0006\6\v\0009\6\f\0069\6\r\6'\b\14\0+\t\2\0B\6\3\2=\6\16\5=\5\17\0045\5\18\0=\5\19\4=\4\21\3=\3\23\2B\0\2\1K\0\1\0\rsettings\1\0\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\nsetup\vlua_ls\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\bcmd\15rg --files\nfiles\ffzf-lua\frequire∞\b\1\0\b\0003\0É\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0006\4\b\0'\6\t\0B\4\2\0029\4\n\0045\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\f\0006\4\b\0'\6\t\0B\4\2\0029\4\r\0045\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\15\0006\4\b\0'\6\t\0B\4\2\0029\4\16\0045\5\17\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\18\0006\4\b\0'\6\t\0B\4\2\0029\4\19\0045\5\20\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\21\0006\4\b\0'\6\t\0B\4\2\0029\4\22\0045\5\23\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\24\0006\4\b\0'\6\t\0B\4\2\0029\4\25\0045\5\26\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\27\0006\4\b\0'\6\t\0B\4\2\0029\4\28\0045\5\29\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\30\0'\3\21\0006\4\b\0'\6\t\0B\4\2\0029\4\31\0045\5 \0B\0\5\0016\0\b\0'\2\t\0B\0\2\0029\0!\0005\2%\0005\3#\0005\4\"\0=\4$\3=\3&\0025\3-\0005\4+\0006\5\0\0009\5'\0059\5(\5'\a)\0B\5\2\2'\6*\0&\5\6\5=\5,\4=\4.\3=\3\n\0025\0031\0005\0040\0006\5\0\0009\5'\0059\5(\5'\a)\0B\5\2\2'\6/\0&\5\6\5=\5,\4=\4.\3=\0032\2B\0\2\1K\0\1\0\tgrep\1\0\0\1\0\0\26/fzf-lua-grep-history\rfzf_opts\1\0\0\14--history\1\0\0\27/fzf-lua-files-history\tdata\fstdpath\afn\fwinopts\1\0\0\fpreview\1\0\0\1\0\2\rvertical\vup:60%\twrap\twrap\nsetup\1\0\2\fnoremap\2\vsilent\2\16grep_visual\6v\1\0\2\fnoremap\2\vsilent\2\vresume\15<leader>fr\1\0\2\fnoremap\2\vsilent\2\15grep_cword\15<leader>fG\1\0\2\fnoremap\2\vsilent\2\19live_grep_glob\15<leader>fg\1\0\2\fnoremap\2\vsilent\2\19search_history\15<leader>fh\1\0\2\fnoremap\2\vsilent\2\fbuiltin\15<leader>fk\1\0\2\fnoremap\2\vsilent\2\fbuffers\15<leader>fb\1\0\2\fnoremap\2\vsilent\2\nfiles\ffzf-lua\frequire\15<leader>fF\1\0\2\fnoremap\2\vsilent\2\0\15<leader>ff\6n\bset\vkeymap\bvim\0", "config", "fzf-lua")
time([[Config for fzf-lua]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n∆\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\4\nerror\nerror\thint\thint\16information\tinfo\fwarning\twarn\1\0\5\14fold_open\6v\nicons\1\17indent_lines\1\25use_diagnostic_signs\1\16fold_closed\6>\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\2\nâ\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\24colorscheme nordfox\bcmd\bvim\foptions\1\0\0\1\0\1\16transparent\2\nsetup\rnightfox\frequire\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)
-- Config for: nvim-osc52
time([[Config for nvim-osc52]], true)
try_loadstring("\27LJ\2\nU\0\2\b\0\6\0\v6\2\0\0'\4\1\0B\2\2\0029\2\2\0026\4\3\0009\4\4\4\18\6\0\0'\a\5\0B\4\3\0A\2\0\1K\0\1\0\6\n\vconcat\ntable\tcopy\nosc52\frequire{\0\0\6\0\a\1\0194\0\3\0006\1\0\0009\1\1\0019\1\2\0016\3\0\0009\3\1\0039\3\3\3'\5\4\0B\3\2\2'\4\5\0B\1\3\2>\1\1\0006\1\0\0009\1\1\0019\1\6\1'\3\4\0B\1\2\0?\1\0\0L\0\2\0\15getregtype\6\n\5\vgetreg\nsplit\afn\bvim\5ÄÄ¿ô\4€\1\1\0\a\0\19\0\0293\0\0\0003\1\1\0006\2\2\0009\2\3\0025\3\5\0005\4\6\0=\0\a\4=\0\b\4=\4\t\0035\4\n\0=\1\a\4=\1\b\4=\4\v\3=\3\4\0026\2\2\0009\2\f\0029\2\r\2'\4\14\0'\5\15\0'\6\16\0B\2\4\0016\2\2\0009\2\f\0029\2\r\2'\4\14\0'\5\17\0'\6\18\0B\2\4\1K\0\1\0\t\"+yy\15<leader>yy\b\"+y\14<leader>y\6n\bset\vkeymap\npaste\1\0\0\tcopy\6*\6+\1\0\0\1\0\1\tname\nosc52\14clipboard\6g\bvim\0\0\0", "config", "nvim-osc52")
time([[Config for nvim-osc52]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nî\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\5\0\0\a~/\15~/Projects\16~/Downloads\6/\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n‚\3\0\2\18\2\21\0K-\2\0\0009\2\0\2\18\4\0\0B\2\2\2\18\5\2\0009\3\1\2B\3\2\2\21\3\3\0)\4\1\0\1\4\3\0X\4&Ä9\4\2\2\v\4\0\0X\5\2Ä'\4\3\0X\5\6Ä6\5\4\0009\5\5\5'\a\6\0\18\b\4\0B\5\3\2\18\4\5\0006\5\a\0009\5\b\5'\a\t\0B\5\2\0016\5\n\0\18\t\2\0009\a\1\2B\a\2\0A\5\0\4X\b\nÄ6\n\a\0009\n\b\n6\f\4\0009\f\5\f'\14\v\0\18\15\1\0\18\16\4\0009\17\f\tB\f\5\0A\n\0\1E\b\3\3R\bÙ\1276\5\a\0009\5\b\5'\a\r\0B\5\2\1X\4\25Ä\a\1\14\0X\4\5Ä-\4\1\0009\4\15\4\18\6\0\0B\4\2\1X\4\18Ä\a\1\16\0X\4\5Ä-\4\1\0009\4\17\4\18\6\0\0B\4\2\1X\4\vÄ\a\1\18\0X\4\5Ä-\4\1\0009\4\19\4\18\6\0\0B\4\2\1X\4\4Ä-\4\1\0009\4\20\4\18\6\0\0B\4\2\1K\0\1\0\1¿\0¿\19select_default\rfile_tab\ttabe\15file_split\nsplit\16file_vsplit\vvsplit\15stopinsert\nvalue\f%s %s%s\vipairs\bbw!\bcmd\bvim\b%s/\vformat\vstring\5\bcwd\24get_multi_selection\23get_current_picker3\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2¿\vvsplit\15_multiopen2\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2¿\nsplit\15_multiopen1\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2¿\ttabe\15_multiopen1\0\1\5\1\2\0\6-\1\0\0009\1\0\1\18\3\0\0'\4\1\0B\1\3\1K\0\1\0\2¿\tedit\15_multiopen∏\v\1\0\v\0B\0Å\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0024\2\0\0003\3\4\0=\3\3\0023\3\6\0=\3\5\0023\3\b\0=\3\a\0023\3\n\0=\3\t\0023\3\f\0=\3\v\0026\3\0\0'\5\r\0B\3\2\0029\3\14\0035\5)\0005\6\15\0005\a\16\0=\a\17\0065\a\19\0005\b\18\0=\b\20\a=\a\21\0065\a$\0005\b\23\0009\t\22\0=\t\24\b9\t\25\0=\t\26\b9\t\27\0=\t\28\b9\t\29\0009\n\25\0 \t\n\t=\t\30\b9\t\29\0009\n\27\0 \t\n\t=\t\31\b9\t\v\2=\t \b9\t\5\2=\t!\b9\t\a\2=\t\"\b9\t\t\2=\t#\b=\b%\a5\b&\0009\t\22\0=\t\24\b9\t\29\0009\n\25\0 \t\n\t=\t\30\b9\t\29\0009\n\27\0 \t\n\t=\t\31\b9\t\v\2=\t \b9\t\5\2=\t!\b9\t\a\2=\t\"\b9\t\t\2=\t#\b=\b'\a=\a(\6=\6*\5B\3\2\0016\3+\0009\3,\0039\3-\3'\5'\0'\6.\0006\a\0\0'\t/\0B\a\2\0029\a0\a5\b1\0B\3\5\0016\3+\0009\3,\0039\3-\3'\5'\0'\0062\0006\a\0\0'\t/\0B\a\2\0029\a3\a5\b4\0B\3\5\0016\3+\0009\0035\0039\0036\3'\5'\0'\0067\0'\a8\0005\b9\0B\3\5\0016\3+\0009\0035\0039\0036\3'\5'\0'\6:\0'\a;\0005\b<\0B\3\5\0016\3+\0009\0035\0039\0036\3'\5'\0'\6=\0'\a>\0005\b?\0B\3\5\0016\3+\0009\3@\3'\5A\0B\3\2\0012\0\0ÄK\0\1\0008autocmd User TelescopePreviewerLoaded setlocal wrap\bcmd\1\0\2\fnoremap\2\vsilent\2J<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>\15<leader>tz\1\0\2\fnoremap\2\vsilent\2W<cmd>lua require('telescope.builtin').find_files({layout_strategy='vertical'})<CR>\15<leader>tf\1\0\2\fnoremap\2\vsilent\0028<cmd>lua require('telescope.builtin').buffers()<CR>\15<leader>tb\20nvim_set_keymap\bapi\1\0\2\fnoremap\2\vsilent\2\16grep_string\15<leader>tG\1\0\2\fnoremap\2\vsilent\2\14live_grep\22telescope.builtin\15<leader>tg\bset\vkeymap\bvim\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<c-t>\n<c-s>\n<c-v>\t<cr>\f<s-tab>\n<tab>\21toggle_selection\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<esc>\1\0\0\nclose\18layout_config\15horizontal\1\0\0\1\0\1\19preview_cutoff\3\0\17path_display\1\2\0\0\nsmart\1\0\2\20layout_strategy\rvertical\14previewer\2\nsetup\14telescope\0\25multi_selection_open\0\29multi_selection_open_tab\0\31multi_selection_open_split\0 multi_selection_open_vsplit\0\15_multiopen\28telescope.actions.state\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: a.vim
time([[Config for a.vim]], true)
try_loadstring("\27LJ\2\n\\\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\v:A<CR>\n<C-a>\5\bset\vkeymap\bvim\0", "config", "a.vim")
time([[Config for a.vim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd LuaSnip ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\0¿\tbody\15lsp_expandö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\0¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\0¿\tjump\rjumpable\21select_prev_item\fvisible.\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19nvim_list_bufs\bapi\bvimÔ\6\1\0\v\0007\0k6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0029\2\a\0015\4\v\0005\5\t\0003\6\b\0=\6\n\5=\5\f\0045\5\15\0009\6\r\0019\6\14\6B\6\1\2=\6\16\0059\6\r\0019\6\17\6B\6\1\2=\6\18\0059\6\r\0019\6\19\6)\b¸ˇB\6\2\2=\6\20\0059\6\r\0019\6\19\6)\b\4\0B\6\2\2=\6\21\0059\6\r\0019\6\22\6B\6\1\2=\6\23\0059\6\r\0019\6\24\6B\6\1\2=\6\25\0059\6\r\0019\6\26\0065\b\29\0009\t\27\0019\t\28\t=\t\30\bB\6\2\2=\6\31\0053\6 \0=\6!\0053\6\"\0=\6#\5=\5\r\0044\5\5\0005\6$\0>\6\1\0055\6%\0>\6\2\0055\6&\0>\6\3\0055\6'\0005\a)\0003\b(\0=\b*\a=\a+\6>\6\4\5=\5,\4B\2\2\0019\2\a\0019\2-\0025\4.\0005\0050\0009\6\r\0019\6/\0069\6-\6B\6\1\2=\6\r\0054\6\3\0005\a1\0>\a\1\6=\6,\5B\2\3\0019\2\a\0019\2-\2'\0042\0005\0053\0009\6\r\0019\6/\0069\6-\6B\6\1\2=\6\r\0059\0064\0019\6,\0064\b\3\0005\t5\0>\t\1\b4\t\3\0005\n6\0>\n\1\tB\6\3\2=\6,\5B\2\3\0012\0\0ÄK\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\1\3\0\0\6/\6?\fcmdline\fsources\voption\15get_bufnrs\1\0\0\0\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\frequire\1\4\0\0\tmenu\fmenuone\rnoselect\16completeopt\bopt\bvim\0", "config", "nvim-cmp")

vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n‹\1\0\0\n\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd telescope-fzf-native.nvim ]]

-- Config for: telescope-fzf-native.nvim
try_loadstring("\27LJ\2\n’\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nsetup\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

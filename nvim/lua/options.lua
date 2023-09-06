-- (c) Meta Platforms, Inc. and affiliates. Confidential and proprietary.

-- @lint-ignore-every LUA_LUAJIT

local opt = vim.opt

opt.number = true -- show line numbers

opt.showmatch = true -- show matching brackets

opt.smartindent = true -- use c-like indents when no indentexpr is used
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 2 -- use 2 spaces when inserting tabs
opt.tabstop = 2 -- show tabs as 2 spaces

opt.splitright = true -- vsplit to right of current window
opt.splitbelow = true -- hsplit to bottom of current window

opt.hidden = true -- allow background buffers

opt.ignorecase = true -- ignore case in searches...
opt.smartcase = true -- ...unless we use mixed case

opt.joinspaces = false -- join lines without two spaces

opt.inccommand = "nosplit" -- show effects of substitute incrementally

opt.mouse = "a" -- enable mouse mode

opt.updatetime = 400 -- decrease time for cursorhold event

opt.clipboard = "unnamedplus" -- use system clipboard

opt.undodir = vim.fn.expand("~/.vim/undo") -- undo persistence
opt.undofile = true

opt.termguicolors = true -- allow true colors

opt.background = "dark"

opt.colorcolumn = "81" -- highlight the column past the width limit (usually 80) 

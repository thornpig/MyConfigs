-- (c) Meta Platforms, Inc. and affiliates. Confidential and proprietary.

-- @lint-ignore-every LUA_LUAJIT

local cmd = vim.cmd

-- avoid mistyping write/quit
cmd("command WQ wq")
cmd("command Wq wq")
cmd("command W w")
cmd("command Q q")

-- set leader to ,
vim.api.nvim_set_keymap(
  "",
  ",",
  "<Nop>",
  { noremap = true, silent = true }
)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- map d to deleting without yanking (yanking to black hole register)
vim.keymap.set({'n', 'v'}, 'd', '"_d', { noremap = true})

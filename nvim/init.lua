-- (c) Meta Platforms, Inc. and affiliates. Confidential and proprietary.

-- @lint-ignore-every LUA_LUAJIT

require("options")
require("mappings")
require("plugins")
require("lsp")
require("local")

require("meta.hg").setup()
require("plenary.filetype").add_file("meta")
require("telescope").load_extension("myles")
require("telescope").load_extension("biggrep")

-- 设置 leader 键为 <Space>
vim.g.mapleader = " "

local opt = vim.opt
opt.confirm = true        -- Confirm to save changes before exiting modified buffer
opt.number = true         -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.tabstop = 2
opt.shiftwidth = 2        -- 2 spaces for indent width
opt.autoindent = true     -- copy indent from current line when starting new one

opt.ignorecase = true     -- ignore case when searching
opt.smartcase = true      -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = true

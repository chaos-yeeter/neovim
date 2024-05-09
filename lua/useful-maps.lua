local Utils = require("utils")

-- jk & kj as escape
Utils.map("i", "jk", "<Esc>")
Utils.map("i", "kj", "<Esc>")

-- <space> as leader key
vim.g.mapleader = " "

-- <leader>w to write file
Utils.map("n", "<leader>w", ":silent write<CR>")

-- <leader>q to quit
Utils.map("n", "<leader>q", ":silent quit<CR>")

-- <leader>c to close current buffer & reopen last closed buffer in it's place
Utils.map("n", "<leader>c", ":silent bp<bar>sp<bar>bn<bar>bd<CR>")

-- keep cursor in the middle while scrolling half page
Utils.map("n", "<C-d>", "<C-d>zz")
Utils.map("n", "<C-u>", "<C-u>zz")

-- keep search results in center while scrolling
Utils.map("n", "n", "nzz")
Utils.map("n", "N", "Nzz")

-- retain copied word after pasting on selection
Utils.map("x", "<leader>p", "\"_dP")

-- copy to system clipboard
Utils.map("n", "<leader>y", "\"+y")
Utils.map("v", "<leader>y", "\"+y")
Utils.map("n", "<leader>Y", "\"+Y")

-- open gitui (needs gitui to be installed)
Utils.map("n", "<leader>gg", ":silent terminal gitui<CR>:startinsert<CR>")

-- use Ctrl + h/j/k/l for window navigation
Utils.map("n", "<C-h>", ":wincmd h<CR>")
Utils.map("n", "<C-j>", ":wincmd j<CR>")
Utils.map("n", "<C-k>", ":wincmd k<CR>")
Utils.map("n", "<C-l>", ":wincmd l<CR>")

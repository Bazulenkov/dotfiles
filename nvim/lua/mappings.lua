require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "oo", "o<ESC>", { desc = "Insert new line under and go there"})
map("n", "OO", "O<ESC>j", { desc = "Insert new line above"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

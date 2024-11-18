-- Set the leader key to space
vim.g.mapleader = " "

-- Set the local leader key to backslash (\)
vim.g.maplocalleader = "\\"

-- Create a local variable for easier access to vim.keymap
local keymap = vim.keymap

-- Exit insert mode by pressing 'jk'
keymap.set("i", "jk", "<ESC>")

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Increment the number under cursor
keymap.set("n", "<leader>+", "<C-a>")

-- Decrement the number under cursor
keymap.set("n", "<leader>-", "<C-x>")

-- Split window vertically
keymap.set("n", "<leader>sv", "<C-w>v")

-- Split window horizontally
keymap.set("n", "<leader>sh", "<C-w>s")

-- Make split windows equal width & height
keymap.set("n", "<leader>se", "<C-w>=")

-- Close current split window
keymap.set("n", "<leader>sx", "<cmd>close<CR>")

-- Open new tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")

-- Close current tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")

-- Go to next tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")

-- Go to previous tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")

-- Move current buffer to a new tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>")

-- Select all text in the current buffer
keymap.set("n", "<C-a>", "gg<S-v>G")

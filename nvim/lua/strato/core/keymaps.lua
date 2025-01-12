-- Set the leader key to space
vim.g.mapleader = " "
-- Set the local leader key to backslash (\)
vim.g.maplocalleader = "\\"

-- Create a local variable for easier access to vim.keymap
local keymap = vim.keymap

-- Exit insert mode by pressing 'jk' 
keymap.set("i", "jk", "<Esc>")

-- Clear search highlights
keymap.set("n", "nh", ":nohlsearch<CR>")

-- Increment the number under cursor
keymap.set("n", "+", "<C-a>")

-- Decrement the number under cursor
keymap.set("n", "-", "<C-x>")

-- Split window vertically
keymap.set("n", "sv", ":vsplit<CR>")

-- Split window horizontally
keymap.set("n", "sh", ":split<CR>")

-- Make split windows equal width & height
keymap.set("n", "se", ":wincmd =<CR>")

-- Close current split window
keymap.set("n", "sx", ":close<CR>")

-- Open new tab
keymap.set("n", "to", ":tabnew<CR>")

-- Close current tab
keymap.set("n", "tx", ":tabclose<CR>")

-- Go to next tab
keymap.set("n", "tn", ":tabnext<CR>")

-- Go to previous tab
keymap.set("n", "tp", ":tabprevious<CR>")

-- Move current buffer to a new tab
keymap.set("n", "tf", ":tabnew %<CR>")

-- Select all text in the current buffer
keymap.set("n", "sa", "ggVG")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function desc(d)
	return vim.tbl_extend("force", opts, { desc = d })
end

-- General
map("i", "jk", "<Esc>", desc("Exit insert mode"))
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", desc("Clear highlights"))

-- Numbers (native <C-a>/<C-x> preserved via + and -)
map("n", "+", "<C-a>", desc("Increment number"))
map("n", "-", "<C-x>", desc("Decrement number"))

-- Select all
map("n", "<leader>a", "gg<S-v>G", desc("Select all"))

-- Windows
map("n", "<leader>sv", "<cmd>vsplit<CR>", desc("Split vertical"))
map("n", "<leader>sh", "<cmd>split<CR>", desc("Split horizontal"))
map("n", "<leader>se", "<cmd>wincmd =<CR>", desc("Equalize splits"))
map("n", "<leader>sx", "<cmd>close<CR>", desc("Close split"))

-- Tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", desc("New tab"))
map("n", "<leader>tx", "<cmd>tabclose<CR>", desc("Close tab"))
map("n", "<leader>tn", "<cmd>tabnext<CR>", desc("Next tab"))
map("n", "<leader>tp", "<cmd>tabprevious<CR>", desc("Prev tab"))

-- Buffers (navigation handled by bufferline.nvim)
map("n", "<leader>bd", "<cmd>bdelete<CR>", desc("Delete buffer"))

-- Visual mode
map("v", "<", "<gv", desc("Indent left"))
map("v", ">", ">gv", desc("Indent right"))
map("v", "J", ":m '>+1<CR>gv=gv", desc("Move block down"))
map("v", "K", ":m '<-2<CR>gv=gv", desc("Move block up"))

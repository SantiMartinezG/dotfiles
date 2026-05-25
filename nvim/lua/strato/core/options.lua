local opt = vim.opt
local g = vim.g

-- Providers (disabled — modern Lua plugins don't need them)
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0

-- UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.fillchars = { eob = " " } -- Hide ~ on empty lines

-- Indentation (2 spaces default; Go overridden per-filetype later)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.inccommand = "split"

-- Splits
opt.splitright = true
opt.splitbelow = true

-- System
opt.clipboard:append("unnamedplus")
opt.updatetime = 250
opt.timeoutlen = 400
opt.mouse = "a"
opt.confirm = true -- Prompt to save instead of failing on :q

-- Undo
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

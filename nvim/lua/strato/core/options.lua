-- Set the style of the file explorer (netrw) to tree view
vim.g.netrw_liststyle = 3

-- Create a local variable for easier access to vim.opt
local opt = vim.opt

-- Enable relative line numbers
opt.relativenumber = true

-- Show the current line number
opt.number = true

-- Set tab width to 2 spaces
opt.tabstop = 2

-- Set the shift width for indentation to 2 spaces
opt.shiftwidth = 2

-- Use spaces instead of tabs
opt.expandtab = true

-- Enable auto-indentation
opt.autoindent = true

-- Disable line wrapping
opt.wrap = false

-- Ignore case in search patterns
opt.ignorecase = true

-- Override ignorecase if the search pattern contains upper case characters
opt.smartcase = true

-- Highlight the current line
opt.cursorline = true

-- Enable 24-bit RGB color in the TUI
opt.termguicolors = true

-- Set the color scheme to dark mode
opt.background = "dark"

-- Always show the signcolumn (used for displaying signs like git status, linter warnings, etc.)
opt.signcolumn = "yes"

-- Allow backspacing over indentation, line breaks, and the start of insert
opt.backspace = "indent,eol,start"

-- Use the system clipboard for all operations
opt.clipboard:append("unnamedplus")

-- Open new vertical splits to the right
opt.splitright = true

-- Open new horizontal splits below
opt.splitbelow = true

-- Disable swap file creation
opt.swapfile = false

-- Ensure Neovim recognizes .astro files and sets the correct filetype
-- This enables proper syntax highlighting, LSP support, and plugin integrations for Astro files
vim.cmd([[au BufNewFile,BufRead *.astro set filetype=astro]])

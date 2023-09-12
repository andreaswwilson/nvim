vim.o.clipboard = "unnamedplus"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.mouse = "a"
vim.opt.undofile = true -- save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- spell checking
-- ]s next misspelled word
-- z= - suggestion
-- zg - add to spell
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

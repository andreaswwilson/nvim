vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected lines in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])   -- Dont overwrite regster when pasting
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "x", '"_x')              -- delete single char without copy into register
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd> w <CR>', { desc = 'Save file' })
vim.keymap.set("n", "<tab>", '<cmd>bn<cr>', { desc = 'Next buffer' })
vim.keymap.set("n", "S-<tab>", '<cmd>bn<cr>', { desc = 'Previous buffer' })
----------------------
-- Plugin Keybinds
----------------------
-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })                -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find by grep" })               -- find string in current working directory as you type
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" }) -- find string under cursor in current working directory
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>")                                      -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")                                          -- list available help tags
vim.keymap.set("n", "<leader>?", "<cmd>Telescope oldfiles<cr>", { desc = "Find recently opened files" })

-- tmux
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")

-- Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })

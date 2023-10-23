-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap                -- for conciseness

keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected lines in visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("x", "<leader>p", [["_dP]])   -- Don't overwrite register when pasting
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap.set("n", "x", '"_x')              -- delete single char without copy into register
-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap.set({ "n", "i" }, "<C-s>", "<cmd> w <CR>", { desc = "Save file" })
keymap.set("n", "<tab>", "<cmd>bn<cr>", { desc = "Next buffer" })
keymap.set("n", "S-<tab>", "<cmd>bn<cr>", { desc = "Previous buffer" })

keymap.set("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close current buffer without closing window" })

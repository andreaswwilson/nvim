return {
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	-- you can use the VeryLazy event for things that can
	-- load later and are not important for the initial UI
	event = "VeryLazy",
	config = function()
		-- tmux
		vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
		vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
		vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
		vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
	end,
}

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			-- list of servers for mason to install
			ensure_installed = {
				"gopls",
				"lua_ls",
				"pyright",
				"terraformls",
				"yamlls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		require("mason-null-ls").setup({
			automatic_installation = true,
		})

	end,
}

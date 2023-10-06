return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
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

		-- Used to install linters and formatters
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				-- python
				"ruff",
				"black",
				"mypy",
				-- go
				"golangci-lint",
				"gofumpt",
				"goimports",
				-- lua
				"stylua",
				"luacheck",
				-- json
				"jsonlint",
				-- bash
				"shfmt",
				"shellcheck",
			},
		})

		require("mason-nvim-dap").setup({
			ensure_installed = { "python", "delve" },
			handlers = {}, -- sets up dap in the predefined manner
		})
	end,
}

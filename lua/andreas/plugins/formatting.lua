return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				sh = { "shfmt" },
				markdown = { "prettierd" },
				go = { "goimports", "gofumpt" },
				python = { "ruff", "black" },
				terraform = { "terraform_fmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
				async = false,
			},
		})
	end,
}

return {
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- import null-ls plugin
		local null_ls = require("null-ls")

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		-- configure null_ls
		null_ls.setup({
			-- setup formatters & linters
			sources = {
				-- make sure the source name is supported by null-ls
				-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
				-- golang
				formatting.gofumpt,
				formatting.goimports,
				diagnostics.golangci_lint,
				-- Lua
				formatting.stylua,
				-- Python
				formatting.black,
				formatting.isort,
				diagnostics.ruff,
				diagnostics.mypy,
				-- Terraform
				diagnostics.terraform_validate,
				formatting.terraform_fmt,
			},

			-- configure format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}

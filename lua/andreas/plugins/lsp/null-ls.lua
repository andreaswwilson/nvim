return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- import null-ls plugin
		local null_ls = require("null-ls")

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				diagnostics.mypy.with({
					extra_args = function()
						local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
						return { "--python-executable", virtual .. "/bin/python3" }
					end,
				}),
				formatting.prettierd, -- first due to rare race conditions
				formatting.isort,
				formatting.black,
				formatting.gofumpt,
				formatting.stylua,
				formatting.terraform_fmt,
				formatting.ruff,
				formatting.jq,
				null_ls.builtins.code_actions.shellcheck,
				formatting.shfmt,
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

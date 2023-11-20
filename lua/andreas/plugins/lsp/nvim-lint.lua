return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
		lint.linters.mypy.args =
			vim.list_extend({ "--python-executable", virtual .. "/bin/python3" }, lint.linters.mypy.args)
		lint.linters_by_ft = {
			go = { "golangcilint" },
			python = { "bandit", "ruff", "mypy" },
			lua = { "luacheck" },
			yaml = { "yamllint" },
			json = { "jsonlint" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",

		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,
				-- enable indentation
				indent = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
					"dockerfile",
					"gitcommit",
					"gitignore",
					"go",
					"gomod",
					"gosum",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"rust",
					"terraform",
					"toml",
					"vim",
					"xml",
					"yaml",
				},

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,
			})
		end,
	},
}

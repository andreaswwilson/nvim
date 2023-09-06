local lsp = require('lsp-zero').preset({})

lsp.set_server_config({
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    }
  }
})

lsp.ensure_installed({
  'bashls',
  'gopls',
  'jsonls',
  'lua_ls',
  'pyright',
  'terraformls',
  'yamlls',
})



lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  -- Autoformat on save
  lsp.buffer_autoformat()

  -- Add keymaps. Mainly as default, but adding them for reference
  vim.keymap.set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = true, desc = "LSP rename" })
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = true, desc = "Show LSP hover information" })
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = true, desc = "Go to LSP definition" })
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { buffer = true, desc = "Go to LSP declaration" })
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
    { buffer = true, desc = "Go to LSP implementation" })
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
    { buffer = true, desc = "Go to LSP type definition" })
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
    { buffer = true, desc = "Show LSP signature help" })
  vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>',
    { buffer = true, desc = "Trigger LSP code actions" })
  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>',
    { buffer = true, desc = "Open diagnostics floating window" })
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>',
    { buffer = true, desc = "Go to previous diagnostic location" })
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>',
    { buffer = true, desc = "Go to next diagnostic location" })
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>',
    { buffer = true, desc = "Search LSP references using Telescope" })
end)

local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-e>"] = cmp.mapping.abort(),            -- close completion window
    ["<C-Space>"] = cmp.mapping.complete(),     -- show completion suggestions
  }
})

lsp.setup()

-- Null-ls
local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    -- make sure the source name is supported by null-ls
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.formatting.black
  }
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = true,
})

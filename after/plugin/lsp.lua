local lsp_zero = require('lsp-zero')
require('mason').setup({})

lsp_zero.set_server_config({
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    }
  }
})
require('mason-lspconfig').setup({
  ensure_installed = { 'gopls', 'lua_ls', 'pyright', 'terraformls', 'yamlls' },
  handlers = {
    lsp_zero.default_setup,
  }
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  lsp_zero.buffer_autoformat()
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


---
-- Autocompletion config
---
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})

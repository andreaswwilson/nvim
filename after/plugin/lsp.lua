local lsp = require('lsp-zero')
lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  'bashls',
  'gopls',
  'jsonls',
  'lua_ls',
  'pyright',
  'terraformls',
  'yamlls',
})

-- Autoformat on save
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  lsp.buffer_autoformat()
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true, desc = "LSP references" })
  vim.keymap.set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = true, desc = "LSP rename" })
end)


-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

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

vim.diagnostic.config({
  virtual_text = true
})

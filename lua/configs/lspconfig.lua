-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "clangd", "pylsp" } -- "pyright", "html", "cssls" 
local nvlsp = require "nvchad.configs.lspconfig"

local lsp_keymaps = function(bufnr)
  -- go to different defintion of defintion, types, and implementations
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=bufnr})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=bufnr, desc="go to definition"})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=bufnr, desc="go to type definition"})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=bufnr, desc="go to implementation"})
  
  -- go through diagnostics
  vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer=bufnr, desc="go to next diagnostic"})
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=bufnr, desc="go to prev diagnostic"})

  -- list diagnostics of workspace
  vim.keymap.set("n", "<leader>dl", require("telescope.builtin").diagnostics, {buffer=bufnr, desc="list diagnostics in ran script"})

  -- finds instances of this function in the workflow
  vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, {buffer=bufnr, desc="find all instances of this function in folder"})
end


-- Wrap the original on_attach
local function custom_on_attach(client, bufnr)
  nvlsp.on_attach(client, bufnr) -- Call NvChad's default on_attach
  lsp_keymaps(bufnr)             -- Then your custom keymaps
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.lspconfig"
    end,
  },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

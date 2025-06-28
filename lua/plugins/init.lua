return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
    config = function()
      local capabilities = require("configs.lspconfig")
      local lsp_keymaps = function()
        -- go to different defintion of defintion, types, and implementations
        vim.keymap.set("n","K",vim.lsp.buf.hover,{buffer=0})
        vim.keymap.set("n","gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n","gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n","gi", vim.lsp.buf.implementaton, {buffer=0})
        -- go through diagnostics
        vim.keymap.set("n","<leader>df", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n","<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
        -- list diagnostics of workspace
        vim.keymap.set("n","<leader>dl", "<cmd>Telescope diagnostic<cr>", {buffer=0})
        -- finds instances of this function in the workflow
        vim.keymap.set("n","<leader>fr", require("telescope.builtin").lsp_references, {buffer=0})
      end

    -- Set up the config for every lanaguage server
    require"lspconfig".clangd.setup{
      capabilities = capabilities 
      on_attach = lsp_keymaps
    }
    require"lspconfig".pylsp.setup{
      capabilities = capabilities 
      on_attach = lsp_keymaps
    }
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.plugins.dap"
    end,
  },
  
  {
  "williamboman/mason.nvim",
  opts = {
  	ensure_installed = {
  		"pyright",
      "python-lsp-server",
      "clangd"
  	}
  },
  
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
  }
}

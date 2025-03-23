vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


vim.opt.relativenumber=true



-- Copying to system clipboard
-- From current cursor position to EOL (normal mode)
vim.keymap.set({'n'}, '<C-c>', '"+y$')
-- Current selection (visual mode)
vim.keymap.set({'v'}, '<C-c>', '"+y$')

-- Pasting to system clipboard
-- From current cursor position (normal mode)
vim.keymap.set({'n'}, '<C-v>', '"+p$')
-- Current selection (visual mode)
vim.keymap.set({'v'}, '<C-v>', '"+p')

-- Map CTLR-q and CTLR-e as moving to prev and next word respectively in every mode
-- From current cursor position to EOL (normal mode)
vim.keymap.set({'n','v','i'}, '<C-e>', '<S-right>')
vim.keymap.set({'n','v','i'}, '<C-q>', '<S-left>')

-- Map for the terminal for easier use
local t_opts = {silent = true}
--vim.keymap.set('t', '<C-x>', '<C-\\><C-N><C-w><esc>', t_opts) -- Get into interminal mode with 'x' (doesn't actually work)
-- Switch between windows easier
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', t_opts) 
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', t_opts)
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', t_opts)
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', t_opts)

require "plugins"


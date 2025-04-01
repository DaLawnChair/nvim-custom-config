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

-- for percentage of the file we've scrolled
-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center components here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}




-- saving the visual blockwise selector (must be done before pasting
vim.keymap.set({'n'}, '<leader><C-v>', '<C-v>')
vim.keymap.set({'v'}, '<leader><C-v>', '<C-v>')
-- vim.keymap.set({'i'}, '<leader><C-v>', '<C-v>')

-- Copying to system clipboard
-- From current cursor position to EOL (normal mode)
vim.keymap.set({'n'}, '<C-c>', '"+y$')
vim.keymap.set({'v'}, '<C-c>', '"+y$')

-- Pasting to system clipboard
-- From current cursor position (normal mode)
vim.keymap.set({'n'}, '<C-v>', '"+p$')
vim.keymap.set({'v'}, '<C-v>', '"+p$')

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


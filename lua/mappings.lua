require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- for debugging
local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

-- DEBUGGER
--map('n', '<leader>db', function() require('dap').toggle_breakpoint() end, {desc = "Add breakpoint at line"}, {noremap=true})
--map('n', '<leader>dr', function() require('dap').toggle_breakpoint() end, {desc = "Add breakpoint at line"}, {noremap=true})
--map('n', '<C-b>', function() require('dap').toggle_breakpoint() end, {desc = "Add breakpoint at line"})

--map('n', '<leader>dr', function() require('dap').toggle_breakpoint() end, {desc = "Add breakpoint at line"})

return M

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

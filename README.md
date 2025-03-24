**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Adding new LSPs 
1) open `lua/cspconfig.lua`
2) add a new entry into the `servers` set.
3) save the file 
4) run `:MasonInstallAll` inside a Nvim terminal 

# Adding new keymaps
1) open `init.lua`
2) add a new entry of the form `vim.keymap.set({MODE(s)}, 'KEYPRESSES', '"ACTION')`
3) restart all Nvim terminal instances

# Noted installations:
`sudo apt install g++-12` For Clang and GCC

The new keymaps should be loaded in and available to run!
# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

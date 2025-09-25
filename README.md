# noir.nvim
neovim support for the [Noir](https://noir-lang.org/) language

## Features
- re-use rust grammar for all your tree-sitting needs
- configure `aztec-nargo lsp` as an LSP
- keep a `tags` file up-to-date (index entire codebase at startup, + append tags of noir files after reading or writing them) for when nargo inevitably crashes.

## Installation
Using [pckr](https://github.com/lewis6991/pckr.nvim):
```lua
{
    "0xteddybear/noir.nvim",
    requires = { "nvim-treesitter/nvim-treesitter"},
    config = function()
        require("noir").setup()
    end,
},
```

## TODO
- [ ] config flag to force *always* using ctags instead of LSP go-to-definition (currently it uses the default nvim behaviour of using the LSP if available, otherwise falling back to ctags)
- [ ] config flag to disable LSP entirely

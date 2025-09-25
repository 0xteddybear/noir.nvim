# noir.nvim
neovim support for the Noir language

Features:
- re-use rust grammar for all your tree-sitting needs
- configure `aztec-nargo lsp` as an LSP
- keep a `tags` file up-to-date (index entire codebase at startup, + append tags of noir files after reading or writing them) for when nargo inevitably crashes.

## TODO
- [ ] config flag to force *always* using ctags instead of LSP go-to-definition (currently it uses the default nvim behaviour of using the LSP if available, otherwise falling back to ctags)
- [ ] config flag to disable lsp entirely

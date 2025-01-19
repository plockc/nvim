## Guide

[Josean Martinez - 2024 Ultimate Guide](https://www.youtube.com/watch?v=6pAG3BHurdM)
[Example plugins](https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim/lua/josean/plugins)

mason - installs binaries
auto-session - save window state
bufferline - better looking tabs
dressing - pop up dialogs (prettier)
gitsigns - show in the gutter +/-/ delta for git
lualine - info line at bottom of buffer
moonfly - color theme
telescope - fuzzy find strings/files
trouble - easier to navigate issues
lsp-config - configures LSP servers, used with mason-lspconfig
conform - formatting
nvim-tree - file navigation
vim-maximizer - maximize a buffer
which-key - when hitting leader, gives hints and descriptions
treesitter - better highlighting and indenting, and tree selection
nvim-cmp - completion
comment - motions for comment
surround - add/remove surrounding characters (like ')', '"', ']')

## leader hotkey prefixes (will see completions via which-key)

## other key mappings

K - show docs
gd - goto definition
gt - telescope type definitions
gi - telescope implementations
gR - telecope references
<leader>rn - rename
] and [ d - next / previous diagnostic

use Ctrl-o and Ctrl-i to jump back from a jump (or back in), e.g `gd` then `Ctrl-o` then `Ctrl-i`

gc <motion> comment / uncomment

<C-space> expand selection based on syntax

ys <motion>) - surround with parenthesis
ds] - delete brackets
cs'" - change single to double quotes

During completion:
TAB and Shift-TAB - select
Esc - abort
Enter - accept selected

# Troubleshooting

Can MasonUninstallAll and restart to re-install binaries (sometimes does not auto install)

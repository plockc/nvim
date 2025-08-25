# 💤 LazyVim

Install dependencies:

``` bash
brew install lazygit fzf watch
```

Setup neovim

```bash
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
git clone https://github.com/plockc/neovim-starter ~/.config/nvim
nvim
```

Open `:LazyExtras` and ensure these are enabled:

* ai/codeium
* coding/nvim-cmp - completion, needed for windsurf? else blink
* dap/nvim-dap-* - debugger
* editor/fzf
* editor/illuminate - highlight other uses of the word under cursor
* editor/leap - motions - need to read up on it
* editor/navic
* editor/neo-tree - tree explorer for files
* editor/outline - symbol outline
* lang/docker go helm java JSON markdown sql 
* ui/treesitter-context - shows the func at the top of the window

Exit and start again

Log into windsurf.com


`:Codium Auth` and choose browser auth option


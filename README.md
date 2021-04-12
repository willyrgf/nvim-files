nvim-files
========

My NeoVim custom configuration based on the [vim-bootstrap](https://github.com/avelino/vim-bootstrap).

### Requirement
- nodejs >= 10.12 (coc.nvim)
```sh
curl -sL install-node.now.sh/lts | sudo bash
```

- neovim >= 0.3.2 [how-to install here](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```sh
# or
sudo snap install nvim --classic
```

- rust-analyzer
```sh
# add on your $PATH the ~/.local/bin/
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
```

- elixir-ls
```sh
git clone git@github.com:elixir-lsp/elixir-ls.git ~/.elixir-ls
cd ~/.elixir-ls
mix deps.get
mix compile
MIX_ENV=prod mix elixir_ls.release
```

- git 
- ctags 
- curl 
- make (or gmake if BSD system)


### For install
```sh
git clone https://github.com/willyrgf/nvim-files.git ~/nvim-files/
cd ~/nvim-files/ && ./install_vimrc.sh
```

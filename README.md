# init.vim
My vim/neovim config file. Trying to keep it as simple as possible, so should be portable between the two. For lua specific plugins or config, I have added behind an if check, so it shouldn't be loaded in vim.

## Usage:
You should do `source <filename.vim>` for each of the configuration files you need.
minimal.vim: Only most barebones config, no plugins or gui
plugins.vim: load this to add some useful plugins, has some optional arguments (see top of file)
gui.vim: load this if you are in gui mode (e.g. in ~/.gvimrc)

Example init.vim file:
```
" See more config values at the top of plugins.vim
let g:load_treesitter=1
source ~/.config/nvim/minimal.vim
source ~/.config/nvim/plugins.vim
colorscheme jellybeans
```

You can also clone this repo directly to e.g. `~/.config/nvim` or wherever your vim loads config files from.

If you clone in some other directory and want to use the extended C syntax you can use the commands below to symlink the syntax files into vim's syntax search path. Do note however that the syntax rule assumes that custom structs are in PascalCase or have \_t postfix in them, so if your code follows some other code guidelines, this might have weird results.
```
# For vim
ln -s <path_to_this_repo>/after/syntax/c.vim ~/.vim/after/syntax/c.vim
# For nvim
ln -s <path_to_this_repo>/after/syntax/c.vim ~/.config/nvim/after/syntax/c.vim
```
If you are using treesitter, the syntax stuff is pretty useless though.

### Installing plugged vim:

#### Vim
##### Unix
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

##### Windows (PowerShell)

```
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)
```

#### Neovim
##### Unix, Linux

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

##### Linux (Flatpak)

```
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

##### Windows (PowerShell)

```
md ~\AppData\Local\nvim-data\site\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim-data\site\autoload\plug.vim"
  )
)
```


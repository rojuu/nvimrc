# init.vim
My vim/neovim config file. Trying to keep it as simple as possible, so should be portable between the two.

## Usage:
You should do `source <filename.vim>` for each of the configuration files you need.
minimal.vim: Only most barebones config, no plugins or gui
plugins.vim: load this to add some useful plugins, has some optional arguments (see top of file)
gui.vim: load this if you are in gui mode (e.g. in ~/.gvimrc)

Example init.vim/.vimrc file:
```
" See more config values at the top of plugins.vim
let g:load_fzf=1

source ~/Projects/vimrc/minimal.vim
source ~/Projects/vimrc/plugins.vim

set bg=dark
colorscheme jellybeans
```

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


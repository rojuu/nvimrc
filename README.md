# init.vim
My vim/neovim config file. Trying to keep it as simple as possible, so should be fairly portable between the two. Any nvim/lua specific plugins or config have been setup to not run in regular vim.

## Usage (nvim)
Firstly clone this repo into `~/.config/nvim` (or `C:/Users/<username>/AppData/Local/nvim` on windows).

There is no default init.vim file present, you should instead add one and `source <filename.vim>` for each of the configuration files you want to load.
minimal.vim: Only most barebones config, no plugins or gui
plugins.vim: Plugins and their configs, also loads lua config
gui.vim: Gui specific config (load from `ginit.vim` for best experience)

Example init.vim file:
```
source ~/.config/nvim/minimal.vim
source ~/.config/nvim/plugins.vim
colo jellybeans
```

### Installing plugged vim:

The config uses the plugged vim plugin manager (if you load the plugins.vim file), so you need to have it installed. Below are instructions to install it for each given setup.

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


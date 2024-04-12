# init.lua
My neovim config file.

## Usage

Just clone the repo in your nvim config directory, e.g. `~/.config/nvim` or `$HOME\AppData\Local\nvim`. lazy.nvim will automatically install itself and all plugins when first starting up nvim.

### Windows/WSL

If using from WSL on windows, it's useful to install [win32yank](https://github.com/equalsraf/win32yank) somewhere in your linux PATH so nvim can find it. If you run `:checkhealth` in nvim, you should see the following section:
```
- OK Clipboard tool found: win32yank
```
This will enable copy/paste to and from vim with `"*` or `"+` registers in WSL environment.


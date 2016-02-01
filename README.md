   Bash-Config
My bash config,  using this to pull to remote servers

![Screenshot](https://raw.githubusercontent.com/Jiggins/Bash-Config/master/images/Terminology.png)

## Installation
```bash
git clone https://github.com/Jiggins/Bash-Config.git
cd Bash-Config && ./install
```

## Features
### Vim
- Toggle background transparency

## Bash Scripts
| Script                                                                                 | Author                                     | Function                           |
| :------------------------------------------------------------------------------------: | :----------------------------------------- | :--------------------------------- |
| [`diffconflicts`](https://github.com/whiteinge/dotfiles/blob/master/bin/diffconflicts) | [Seth House](https://github.com/whiteinge) | A better vimdiff mergetool for Git |
| [`git-forest`](https://github.com/jwiegley/git-scripts/blob/master/git-forest)         | Jan Engelhardt                             | Alternative `git log` function     |

## Vim Key Binds

### General
| Shortcut | Function                      |
| :------: | :---------------------------- |
| `Ctrl /` | Comment line                  |
| `Ctrl a` | Increment number under cursor |
| `Ctrl x` | Decrement number under cursor |
| `Ctrl p` | Open fuzzy file finder        |
| `;;`     | Show recent commands          |

### Tabs
| Shortcut | Function         |
| :------: | :--------------- |
| `Ctrl t` | New tab          |
| `Ctrl n` | Next tab         |
| `⇧ tab`  | Next tab         |
| `Ctrl b` | Previous tab     |
| `Ctrl w` | Close tab (quit) |

### Toggle Options
| Shortcut | Function                                                          |
| :------: | :---------------------------------------------------------------- |
| `;t`     | Toggle Background transparency                                    |
| `;p`     | Toggle Paste Mode                                                 |
| `;w`     | Toggle show hidden characters (:list)                             |
| `;W`     | Remove trailing whitespace - leaves one blank line at end of file |
| `;n`     | Toggle line numbers and gitGutter                                 |

### Splitting Windows
| Shortcut         | Function                     |
| :--------------: | :--------------------------- |
| `;k` or `;Up`    | Open File explorer on top    |
| `:j` or `;Down`  | Open File explorer on bottom |
| `:h` or `;Left`  | Open File explorer on left   |
| `:l` or `;Right` | Open File explorer on left   |

## Plugins included
| Name                                | Description                                                                              |
| :---------------------------------- | :--------------------------------------------------------------------------------------- |
| [gmarik/Vundle.vim][1]              | Vundle, the plug-in manager for Vim                                                      |
| [airblade/vim-gitgutter][2]         | A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks |
| [benmills/vimux][3]                 | Open Tmux panes from inside Vim                                                          |
| [bling/vim-airline][4]              | lean & mean status/tabline for vim that's light as air                                   |
| [christoomey/vim-tmux-navigator][5] | Navigate between Vim and Tmux Panes                                                      |
| [derekwyatt/vim-scala][6]           | Scala plugin for Vim                                                                     |
| [flazz/vim-colorschemes][7]         | One colorscheme pack to rule them all!                                                   |
| [godlygeek/tabular][8]              | Vim script for text filtering and alignment                                              |
| [kien/ctrlp.vim][9]                 | Fuzzy file, buffer, mru, tag, etc finder                                                 |
| [mbbill/undotree][10]               | The ultimate undo history visualizer for VIM                                             |
| [plasticboy/vim-markdown][10]       | Markdown Vim Mode                                                                        |
| [raichoo/haskell-vim][11]           | Hskell plugin for Vim                                                                    |
| [SirVer/ultisnips][12]              | UltiSnips - The ultimate snippet solution for Vim                                        |
| [terryma/vim-multiple-cursors][13]  | True Sublime Text style multiple selections for Vim                                      |
| [tomtom/tcomment_vim][14]           | An extensible & universal comment vim-plugin that also handles embedded filetypes        |
| [tpope/vim-repeat][15]              | repeat.vim: enable repeating supported plugin maps with "."                              |
| [tpope/vim-surround][16]            | Surround.vim: quoting/parenthesizing made simple                                         |

[1]: https://github.com/gmarik/Vundle.vim
[2]: https://github.com/airblade/vim-gitgutter
[3]: https://github.com/benmills/vimux
[4]: https://github.com/bling/vim-airline
[5]: https://github.com/christoomey/vim-tmux-navigator
[6]: https://github.com/derekwyatt/vim-scala
[7]: https://github.com/flazz/vim-colorschemes
[8]: https://github.com/godlygeek/tabular
[9]: https://github.com/kien/ctrlp.vim
[10]: https://github.com/mbbill/undotree
[11]: https://github.com/plasticboy/vim-markdown
[12]: https://github.com/raichoo/haskell-vim
[13]: https://github.com/SirVer/ultisnips
[14]: https://github.com/terryma/vim-multiple-cursors
[15]: https://github.com/tomtom/tcomment_vim
[16]: https://github.com/tpope/vim-repeat
[17]: https://github.com/tpope/vim-surround

## Tmux Key Bindings
| Key          | Function           |
| :----------: | :----------------- |
| `Alt Up`     | Move to pane above |
| `Alt Down`   | Move to pane below |
| `Ctrl Left`  | Move to left pane  |
| `Ctrl Right` | Move to right pane |

## To-do
- [x] install bashrc
- [x] install vimrc
  - [x] copy preferences
  - [x] copy keymap
  - [x] auto install plugins
  - [x] fix vim-airline theme

- [x] git config
- [ ] Documentation

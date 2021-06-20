# dotfiles

## Installing the dotfiles

* Create the `dotfiles` alias (e.g. by adding it to `~/.bash_aliases`):

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
```
* Clone this (bare) repository:

```
git clone --bare https://github.com/gabi-250/dotfiles.git $HOME/.dotfiles
```
* Run `dotfiles checkout` (moving your existing dotfiles out of the way if
  necessary).

function dotfiles
    if test (count $argv) -gt 0 -a "$argv[1]" = "status"
        if test "$argv[2]"
            git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status --untracked-files=no $argv[2..]
        else
            git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status --untracked-files=no
        end
    else
        git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
    end
end

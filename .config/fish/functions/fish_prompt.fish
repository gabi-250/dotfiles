function fish_prompt -d "Write out the prompt"
    set -l exit_status $status
    # Define the colours
    set -l green (set_color --bold 76aa36)
    set -l darkred (set_color cc241d)
    # Define the prompt components
    set -l user $green"$USER@$hostname"
    set -l cwd $darkred(prompt_pwd)
    set -l prompt (set_color normal)">"
    set -l status_info $darkred(printf '[%d]' $exit_status)

    if test $exit_status -ne 0
        printf '%s %s %s %s ' $user $cwd $status_info $prompt(set_color normal)
    else
        printf '%s %s %s ' $user $cwd $prompt(set_color normal)
    end
end

function fish_right_prompt -d "Write out the right prompt"
    set -l lightgray (set_color 6C6C6C)
    echo -n $lightgray(date '+%H:%M:%S')
    set -l duration (math --scale=0 "$CMD_DURATION / 1000")
    if test $duration -gt 0
        echo -n "("$duration"s) "
    else
        echo -n " "
    end
    set -l darkred (set_color cc241d)
end

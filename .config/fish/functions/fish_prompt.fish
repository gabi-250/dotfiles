function fish_prompt -d "Write out the prompt"
    # Define the colours
    set -l green (set_color --bold 76aa36)
    set -l darkred (set_color cc241d)
    # Define the prompt components
    set -l user $green"$USER@$hostname"
    set -l cwd $darkred(prompt_pwd)
    set -l prompt (set_color normal)">"
    printf '%s %s %s ' $user $cwd $prompt(set_color normal)
end

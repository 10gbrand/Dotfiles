# OS detection
set -gx IS_MAC (test (uname) = "Darwin"; and echo 1; or echo 0)
set -gx IS_WSL (test -f /proc/version; and grep -qi microsoft /proc/version; and echo 1; or echo 0)

# Homebrew (Apple Silicon)
if test "$IS_MAC" = 1; and test -d /opt/homebrew
    eval (/opt/homebrew/bin/brew shellenv)
end

# Abbreviations
abbr -a -- ll 'ls -la'
abbr -a -- la 'ls -a'
abbr -a -- g git
abbr -a -- gs 'git status'
abbr -a -- gd 'git diff'
abbr -a -- gc 'git commit'
abbr -a -- gp 'git push'
abbr -a -- gl 'git log --oneline'

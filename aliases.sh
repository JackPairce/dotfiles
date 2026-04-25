# --- General Aliases ---
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'

# --- List Files (ls) ---
alias ls='ls --color=auto'
alias ll='ls -lah'
alias l='ls -CF'
alias la='ls -A'

# --- Git Aliases ---
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gco='git checkout'

# --- Fedora/DNF Aliases ---
alias update='sudo dnf upgrade -y'
alias install='sudo dnf install'
alias remove='sudo dnf remove'

# --- Dotfiles ---
alias dotfiles='cd ~/dotfiles'
alias reload='source ~/.zshrc'

# --- Docker Control ---
alias docker-start='sudo systemctl start docker'
alias docker-stop='sudo systemctl stop docker'
alias dc='docker compose'

# --- Ansible Automation ---
alias sync-system='cd ~/dotfiles/ansible && ansible-playbook -K playbook.yml'
alias snapshot-system='sh ~/dotfiles/ansible/snapshot.sh'

# --- VS Code Profiles ---
alias code-go='code --profile Golang'
alias code-web='code --profile WebDev'
alias code-bash='code --profile Bash'
alias code-devops='code --profile GitOps'
alias code-ai='code --profile AI-Python'
alias code-view='code --profile VIEW-MODE'
alias dot-sync='ansible-playbook -i ~/dotfiles/ansible/inventory.ini ~/dotfiles/ansible/playbook.yml --ask-become-pass'

# Modern replacements
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias lla='eza -lah --icons --group-directories-first'
alias cat='bat'
alias grep='rg'
alias find='fd'

# Even more modern replacements
alias df='duf'
alias du='dust'
alias ps='procs'
alias find='fd'


# Open VS Code from actual recent history
vr() {
    local selected=$(sqlite3 ~/.config/Code/User/globalStorage/state.vscdb "SELECT value FROM ItemTable WHERE [key] = 'history.recentlyOpenedPathsList'" | jq -r '.entries[] | select(.folderUri) | .folderUri' | sed 's|^file://||' | fzf --prompt="Open Recent: ")
    if [ -n "$selected" ]; then
        code "$selected"
    fi
}

# SQL Tools
alias psql='pgcli'
alias sqlite3='litecli'
alias sql='usql'

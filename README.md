# 🚀 Jack's Senior DevOps Dotfiles

A professional, automated, and privacy-first development environment for **Fedora Linux**. Powered by **Ansible**, **Mise**, and the latest **Rust-based** CLI tools.

## ✨ Key Features

- **🎯 One-Command Sync:** Use `dot-sync` to apply all configurations and install packages.
- **🔒 Privacy First:** Sensitive data (Git email, GPU flags) is kept in a git-ignored `local.yml`.
- **💻 VS Code Optimized:** Language-specific profiles (Go, Python, WebDev) with JetBrains Mono ligatures.
- **⚡ Modern CLI Arsenal:** Includes `zoxide`, `atuin`, `fzf`, `delta`, `eza`, `bat`, and more.
- **🛠 DevOps Suite:** Fully configured `docker`, `k9s`, `lazydocker`, and `gh`.
- **⌨️ Advanced Terminal:** Kitty with custom window management and Vim-style navigation.
- **🌙 Neovim (LazyVim):** Automated language "extras" that mirror the VS Code experience.

## 🚀 Quick Start

### 1. Clone the repository
```bash
git clone https://github.com/JackPairce/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Configure Local Variables
Copy the template and fill in your details (name, email, etc.):
```bash
cp ansible/vars/local.yml.example ansible/vars/local.yml
nano ansible/vars/local.yml
```

### 3. Sync Everything
```bash
./setup.sh
# Then use the shortcut anytime
dot-sync
```

## 📦 What's Inside?

### Shell & Terminal
- **Zsh + Oh-My-Zsh:** Powerlevel10k theme with custom plugins.
- **Kitty:** Advanced layouts, splitting, and directory-aware panes.
- **Zoxide:** Smart `cd` that learns your habits.
- **Atuin:** Searchable SQLite-based shell history (`Ctrl+R`).

### Development
- **Mise:** Version manager for Node.js, Python, Go, Rust, Bun, and pnpm.
- **VS Code:** Profiles with tailored themes and extensions.
- **Databases:** `pgcli`, `litecli`, `usql`, and `lazysql`.
- **Git:** `delta` for beautiful diffs and `lazygit` TUI.

### System
- **GNOME:** Automated dconf settings and VS Code project search integration.
- **NVIDIA:** Optional official driver installation (managed via Ansible).

---
*Created and maintained with ❤️ for Fedora.*

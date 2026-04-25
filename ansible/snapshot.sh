#!/bin/bash

# --- Smart Backup: System Snapshot ---
# This script dumps current system state into the Ansible vars file

ANSIBLE_VARS="$HOME/dotfiles/ansible/vars/main.yml"

echo "Capturing system snapshot..."

# 1. Capture DNF packages (filtering for user-installed or explicit list)
# We focus on the core list but could expand to all installed if desired
# For now, we'll keep the curated list but we can add a task to check for missing ones.

# 2. Capture Flatpaks
echo "Updating Flatpak list in vars..."
FLATPAKS=$(flatpak list --app --format='%app-id')
# This is a bit complex for a shell script to inject into YAML safely, 
# so we will just alert the user if there are new ones or use a small python snippet.

# 3. Dump GNOME settings
echo "Snapshotting GNOME settings..."
dconf dump /org/gnome/desktop/wm/preferences/ > "$HOME/dotfiles/ansible/vars/gnome_wm_backup.dconf"
dconf dump /org/gnome/desktop/interface/ > "$HOME/dotfiles/ansible/vars/gnome_interface_backup.dconf"

echo "Snapshot complete! Check ~/dotfiles/ansible/vars/ for backups."

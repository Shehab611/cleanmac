#!/bin/bash
set -e
echo "📦 Installing CleanMac..."

# Find where this repo folder is (the script's own directory)
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Destination paths
SCRIPT_DEST="$HOME/cleanmac"
PLIST_DEST="$HOME/Library/LaunchAgents/com.user.cleanmac.plist"

# 1. Copy the cleanup script
cp "$BASE_DIR/cleanmac" "$SCRIPT_DEST"
chmod +x "$SCRIPT_DEST"

# 2. Copy the plist file
mkdir -p ~/Library/LaunchAgents
cp "$BASE_DIR/com.user.cleanmac.plist" "$PLIST_DEST"

# 3. Load the LaunchAgent
launchctl unload "$PLIST_DEST" 2>/dev/null || true
launchctl load "$PLIST_DEST"

echo "✅ CleanMac installed! It will run every 2 weeks at 9AM (or at login if missed)."

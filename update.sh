#!/bin/bash

echo "Checking for updates..."
cd ~/test  # Adjust path if needed
git pull origin main

# Find the latest version (appvX.py)
latest_version=$(ls appv*.py 2>/dev/null | sort -V | tail -n 1)

if [ -n "$latest_version" ]; then
    echo "Updating to new version: $latest_version"
    mv "$latest_version" appv1.py  # Replace old app.py with latest version
fi

echo "Restarting application..."
pkill -f appv1.py  # Stop running app
nohup python3 appv1.py &  # Restart in the background

echo "Update complete!"


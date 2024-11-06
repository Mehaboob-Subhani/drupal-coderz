#!/bin/bash

# Load environment variables from .env file
source /data/var/www/drupal-coderz/.env || { echo "Failed to load environment variables from .env file."; exit 1; }

echo "Current working directory: $PWD"

# Change directory to your backup repository
cd /data/var/www/drupal-coderz

echo "Current working directory after cd: $PWD"

echo "********************************"
echo "Step 1: Store Commit ID"
echo "********************************"

# Store the current commit ID as an environmental variable
CURRENT_COMMIT=$(git rev-parse HEAD)
echo "Current Commit ID: $CURRENT_COMMIT"

echo "********************************"
echo "Step 2: Deploy on Stage"
echo "********************************"

# Perform git pull with credentials from .env file
git pull https://github.com/Mehaboob-Subhani/drupal-coderz.git main;
drush cr
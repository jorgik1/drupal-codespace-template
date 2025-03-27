#!/bin/bash

# Set non-interactive mode for DDEV
export DDEV_NONINTERACTIVE=true

# Install DDEV
echo "Installing DDEV..."
curl -fsSL https://ddev.com/install.sh | bash

# Check if DDEV installed successfully
if ! command -v ddev &> /dev/null; then
    echo "DDEV installation failed. Please check your network or permissions and try again."
    exit 1
fi

# Start DDEV containers
echo "Starting DDEV..."
ddev start

# Wait until DDEV is fully ready
echo "Waiting for DDEV to start..."
until ddev describe &> /dev/null; do
    sleep 5
    echo "Still waiting for DDEV to be ready..."
done
# Install Composer dependencies
echo "Running composer install..."
ddev composer install && ddev composer require drush/drush


# Install the Drupal site with Drush
echo "Installing Drupal site..."
ddev exec drush site:install standard --account-name=admin --account-pass=admin -y

# Confirm the installation
echo "Drupal installation complete! Access your site via the URL provided by DDEV (check with 'ddev describe')."

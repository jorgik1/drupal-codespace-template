#!/bin/bash
export DDEV_NONINTERACTIVE=true
curl -fsSL https://ddev.com/install.sh | bash
composer install
ddev start
ddev exec drush site:install standard --account-name=admin --account-pass=admin -y

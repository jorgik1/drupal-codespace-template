FROM mcr.microsoft.com/vscode/devcontainers/php:8.1

# Install DDEV dependencies
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates gnupg2 && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce-cli

# Install DDEV
RUN curl -fsSL https://raw.githubusercontent.com/drud/ddev/master/scripts/install_ddev.sh | bash

# Add user to the docker group
RUN usermod -aG docker vscode


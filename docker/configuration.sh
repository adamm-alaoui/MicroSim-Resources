#!/bin/bash

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

log "Step 1: Installing Docker prerequisites and setting up repository..."

sudo apt-get update -y && \
sudo apt-get install -y ca-certificates curl && \
sudo install -m 0755 -d /etc/apt/keyrings && \
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
sudo chmod a+r /etc/apt/keyrings/docker.asc

log "Adding Docker apt repository..."

ARCH=$(dpkg --print-architecture)
DISTRO=$( . /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}" )

echo "deb [arch=$ARCH signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $DISTRO stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

log "Updating apt package index..."
sudo apt-get update -y

log "Step 2: Installing Docker packages..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

log "Step 3: Configuring Docker to run without sudo..."
if ! getent group docker >/dev/null; then
  sudo groupadd docker
  log "Docker group created."
else
  log "Docker group already exists."
fi

sudo gpasswd -a "$USER" docker
log "Added user '$USER' to docker group."

log "Applying new group membership..."
newgrp docker <<EOF
echo "New group applied."
EOF

log "Step 4: Verifying Docker installation by running hello-world container..."
if docker run hello-world; then
  log "Docker hello-world ran successfully."
else
  log "Warning: Docker hello-world did not run successfully. You might need to reboot your system."
fi

log "Step 5: Pulling MicroSim Ceram worker Docker image..."
docker pull adammalaoui/microsim-ceram

log "Listing Docker images to verify..."
docker images | grep adammalaoui/microsim-ceram && log "MicroSim Ceram image pulled successfully." || log "Failed to find MicroSim Ceram image."

log "Script finished."

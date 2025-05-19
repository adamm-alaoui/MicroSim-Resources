#!/bin/bash

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}


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

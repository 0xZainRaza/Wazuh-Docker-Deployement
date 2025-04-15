#!/bin/bash

# Exit on error
set -e

# Optional: colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Cloning the Wazuh Docker repository...${NC}"
git clone https://github.com/wazuh/wazuh-docker.git -b v4.11.2

cd wazuh-docker/single-node

echo -e "${GREEN}Generating certificates for the indexer...${NC}"
docker-compose -f generate-indexer-certs.yml run --rm generator

echo -e "${GREEN}Starting Wazuh stack in foreground (for initial setup)...${NC}"
docker-compose up -d

echo -e "${GREEN}Wazuh Docker stack is up and running.${NC}"

#!/bin/bash

echo "🚀 Setting up environment..."

# Pull latest images
docker-compose pull

# Build demo app image if needed
docker build -t demo-app .

# Start all services
docker-compose up -d

echo "✅ All services started."

# Show container status and health
docker ps
docker ps --filter "health=unhealthy"

# Show logs (optional)
echo "📖 Showing last 20 log lines for each service..."
docker-compose logs --tail=20

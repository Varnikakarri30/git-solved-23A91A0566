 #!/bin/bash
set -e

# Multi-Environment Deploy Script
# Usage: DEPLOY_ENV=production ./scripts/deploy.sh
# Default environment is production

DEPLOY_ENV=${DEPLOY_ENV:-production}

echo "====================================="
echo "DevOps Simulator - Deployment"
echo "Environment: $DEPLOY_ENV"
echo "====================================="

if [ "$DEPLOY_ENV" = "production" ]; then
  echo "Mode: Production"
  DEPLOY_REGION="us-east-1"
  APP_PORT=8080
  echo "Region: $DEPLOY_REGION"
  echo "Port: $APP_PORT"
  echo "Starting production deployment..."
  # Placeholder for real production deploy commands
  # e.g. kubectl apply -f k8s/
elif [ "$DEPLOY_ENV" = "development" ]; then
  echo "Mode: Development"
  DEPLOY_MODE="docker-compose"
  APP_PORT=3000
  echo "Mode: $DEPLOY_MODE"
  echo "Port: $APP_PORT"
  echo "Installing dependencies..."
  if command -v npm >/dev/null 2>&1; then
    npm install
  fi
  echo "Starting development server..."
  if [ -f docker-compose.yml ]; then
    docker-compose up -d
  else
    echo "No docker-compose.yml found; run 'npm run dev' if available"
  fi
else
  echo "Error: Unknown environment $DEPLOY_ENV"
  exit 1
fi

echo "Deployment completed successfully!"

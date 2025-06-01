#!/bin/bash

# Script for manual deployment

VERSION=$1
NAMESPACE="snake-game"

if [[ -z "$VERSION" ]]; then
  echo "Usage: $0 <version>"
  exit 1
fi

# Validate version
if [[ "$VERSION" != "1" && "$VERSION" != "2" ]]; then
  echo "Invalid version. Must be 1 or 2"
  exit 1
fi

echo "Deploying version $VERSION to namespace $NAMESPACE"

helm upgrade --install snake-game ./charts/snake-game \
  --namespace $NAMESPACE \
  --create-namespace \
  --set app.version1.enabled=$([ "$VERSION" == "1" ] && echo "true" || echo "false") \
  --set app.version2.enabled=$([ "$VERSION" == "2" ] && echo "true" || echo "false") \
  --set ingress.hosts[0].host=snake-game.yourdomain.com

echo "Deployment complete. Verifying..."

kubectl rollout status deployment/snake-game-v$VERSION -n $NAMESPACE

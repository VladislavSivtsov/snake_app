#!/bin/bash

# Script for rolling back to previous version

CURRENT_VERSION=$(kubectl get deployment -n snake-game -l app.kubernetes.io/name=snake-game -o jsonpath='{.items[*].metadata.labels.app\.kubernetes\.io/version}')

if [[ "$CURRENT_VERSION" == "1.0" ]]; then
  echo "Currently running version 1. No rollback possible."
  exit 1
elif [[ "$CURRENT_VERSION" == "2.0" ]]; then
  NEW_VERSION="1"
else
  echo "Unknown version: $CURRENT_VERSION"
  exit 1
fi

echo "Rolling back from version ${CURRENT_VERSION} to version ${NEW_VERSION}"

./scripts/deploy.sh $NEW_VERSION

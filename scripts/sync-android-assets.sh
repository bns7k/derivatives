#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ASSET_DIR="$ROOT_DIR/android-app/app/src/main/assets"

mkdir -p "$ASSET_DIR"
cp "$ROOT_DIR/index.html" "$ASSET_DIR/index.html"
cp "$ROOT_DIR/options.pdf" "$ASSET_DIR/options.pdf"

echo "Synced web assets to Android project: $ASSET_DIR"

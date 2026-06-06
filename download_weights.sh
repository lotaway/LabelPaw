#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Creating weight directories..."
mkdir -p "$BASE_DIR/weights/sam_weights"
mkdir -p "$BASE_DIR/weights/yolo26_weights"

echo "Downloading SAM 2.1 Large (~440MB)..."
wget -O "$BASE_DIR/weights/sam_weights/sam2.1_hiera_large.pt" \
  https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_large.pt

echo "Downloading YOLO26n (~7MB)..."
wget -O "$BASE_DIR/weights/yolo26_weights/yolo26n.pt" \
  https://github.com/ultralytics/assets/releases/download/v8.4.0/yolo26n.pt

echo "Downloading YOLO26n-pose (~5MB)..."
wget -O "$BASE_DIR/weights/yolo26_weights/yolo26n-pose.pt" \
  https://github.com/ultralytics/assets/releases/download/v8.4.0/yolo26n-pose.pt

# SAM3 (~3.5GB) requires HuggingFace access permission first.
# 1. Request access: https://huggingface.co/facebook/sam3
# 2. Login: huggingface-cli login
# 3. Uncomment to download:
# echo "Downloading SAM3 (~3.5GB)..."
# huggingface-cli download facebook/sam3 sam3.pt --local-dir "$BASE_DIR/weights/sam_weights"

echo ""
echo "Done! Final structure:"
find "$BASE_DIR/weights" -type f -name "*.pt" | sed "s|$BASE_DIR/||"

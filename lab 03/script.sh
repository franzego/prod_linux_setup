#!/bin/bash

# Script: create_loop_disk.sh
# Purpose: Create a 100MB virtual disk and attach it as a loop device

echo "📦 Creating 100MB virtual disk file: storage.img"
dd if=/dev/zero of=storage.img bs=1M count=100 status=progress

echo "🔄 Attaching disk image to the first available loop device..."
LOOP_DEVICE=$(sudo losetup -fP --show storage.img)

if [[ -z "$LOOP_DEVICE" ]]; then
  echo "❌ Failed to attach loop device."
  exit 1
else
  echo "✅ Attached to: $LOOP_DEVICE"
fi

echo "📋 Loop device summary:"
losetup -a

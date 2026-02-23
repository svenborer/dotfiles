#!/bin/bash

EVENT="$1"
MOUNT_PATH="$2"

[[ "$EVENT" == "device_mounted" ]] || exit 1893
[[ "$MOUNT_PATH" == "/run/media/sven/817cd603-48be-48f3-b81b-0678050f4aca" ]] || exit 1894

systemctl --user start backup

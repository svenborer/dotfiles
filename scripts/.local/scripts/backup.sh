#!/bin/bash
MOUNT="/run/media/sven/817cd603-48be-48f3-b81b-0678050f4aca"
mountpoint -q "$MOUNT" || { echo "$MOUNT not mounted ..."; exit 1893; }
DATE=$(date '+%Y%m%d')
BACKUP_PATH=$MOUNT/backup/$HOSTNAME/$DATE
rsync -avL --mkpath --exclude='chromium' --exclude='mozilla' --exclude='Code - OSS' ~/.config/ $BACKUP_PATH/.config/
rsync -avL ~/.bashrc $BACKUP_PATH
rsync -avL ~/.vimrc $BACKUP_PATH
rsync -avL --mkpath ~/.config/Code\ -\ OSS/User/settings.json "$BACKUP_PATH/.config/Code - OSS/User/"
rsync -avL --mkpath --include='wallpapers/***' --include='scripts/***' --exclude='*' ~/.local/ "$BACKUP_PATH/.local/"

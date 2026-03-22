#!/bin/bash

BACKUP_DIR="/usr/local/backups"
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="${BACKUP_DIR}/apache_backup_${DATE}.tar.gz"
LOG_FILE="${BACKUP_DIR}/apache_backup_${DATE}.log"

# Backup Apache config + document root
tar -czf "$BACKUP_FILE" \
    -C /opt/homebrew/etc httpd \
    -C /opt/homebrew/var www \
    > "$LOG_FILE" 2>&1

# Verify integrity
if [ $? -eq 0 ]; then
    echo "Backup created: $BACKUP_FILE" >> "$LOG_FILE"
    tar -tzf "$BACKUP_FILE" >> "$LOG_FILE" 2>&1
else
    echo "Backup FAILED for $BACKUP_FILE" >> "$LOG_FILE"
fi


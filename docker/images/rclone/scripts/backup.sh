#!/bin/bash

current_datetime=$(date +"%Y-%m-%d_%H_%M_%S")
filename="backup_${BACKUP_PREFIX}_${current_datetime}.7z"

mkdir /tmp/mnt

cp -R /mnt/* /tmp/mnt

# This will overwrite the copied entry by the command above
find /mnt -name "*.sqlite3" -o -name "*.db" | while read fname; do
    sqlite3 $fname ".backup '/tmp/$fname'" && echo "Copied $fname"
done

7z a \
    -t7z -m0=lzma2 -mx=9 -mfb=64 -xr@/data/exclude.txt \
    -md=32m -ms=on -mhe=on -p"${BACKUP_PASSWORD}" \
    "/data/backups/${filename}" /tmp/mnt/*

for i in 1 2 3; do
    remote_drive="REMOTE_DRIVE_$i"
    ping_url="PING_URL_SUCCESS_$i"
    if [[ -n "${!remote_drive}" ]]; then
        rclone copy /data/backups ${!remote_drive}:dogeserver_$BACKUP_PREFIX\_backups && \
        rclone delete --min-age 30d ${!remote_drive}:dogeserver_$BACKUP_PREFIX\_backups && \
        echo "Backup success! remote = ${!remote_drive}" && \
        [[ -n ${!ping_url} ]] && \
        wget ${!ping_url} --no-check-certificate -T 15 -t 10 -O /dev/null -q && \
        echo "Ping success! ping = ${!ping_url}"
    fi
done

rm -r /tmp/mnt
rm /data/backups/*


FROM rclone/rclone

RUN apk update && apk add --no-cache bash tzdata 7zip sqlite

RUN mkdir backups

COPY scripts/entrypoint.sh .
COPY scripts/backup.sh .

RUN chmod +x entrypoint.sh
RUN chmod +x backup.sh

RUN crontab -l | { cat; echo ""; } | crontab -

ENTRYPOINT []

CMD ["/data/entrypoint.sh"]
FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2

FROM caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
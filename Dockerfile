FROM caddy:2.2.1-builder AS builder

RUN caddy-builder \
    --with github.com/mholt/caddy-webdav \
    --with github.com/sjtug/caddy2-filter \

FROM caddy:2.2.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

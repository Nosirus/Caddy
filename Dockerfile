FROM caddy:2.1.0-builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare \
    github.com/mholt/caddy-webdav \
    github.com/sjtug/caddy2-filter

FROM caddy:2.1.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

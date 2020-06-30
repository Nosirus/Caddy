FROM caddy:2-builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare \
    github.com/mholt/caddy-webdav \
    github.com/sjtug/caddy2-filter

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

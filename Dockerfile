FROM caddy:builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare \
    github.com/mholt/caddy-webdav \
    github.com/sjtug/caddy2-filter

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

EXPOSE 2019 443 80
ENV XDG_CONFIG_HOME=/config
ENV XDG_DATA_HOME=/data

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["docker-proxy"]

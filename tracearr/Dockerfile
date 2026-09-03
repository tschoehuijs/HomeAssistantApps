FROM ghcr.io/connorgallopo/tracearr:supervised AS upstream

FROM scratch

COPY --from=upstream / /

COPY --chmod=0755 ha-entrypoint.sh /ha-entrypoint.sh

WORKDIR /app

ENV NODE_ENV=production \
    LOG_LEVEL=info \
    HOST=0.0.0.0 \
    DATABASE_URL=postgresql://tracearr:tracearr@127.0.0.1:5432/tracearr \
    REDIS_URL=redis://127.0.0.1:6379

EXPOSE 3000

ENTRYPOINT ["/ha-entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

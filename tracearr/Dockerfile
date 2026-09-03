FROM ghcr.io/connorgallopo/tracearr:supervised AS upstream
FROM scratch
COPY --from=upstream / /
WORKDIR /app

ENV NODE_ENV=production \
    LOG_LEVEL=info \
    HOST=0.0.0.0 \
    TZ=Europe/Amsterdam \
    DATABASE_URL=postgresql://tracearr:tracearr@127.0.0.1:5432/tracearr \
    REDIS_URL=redis://127.0.0.1:6379

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

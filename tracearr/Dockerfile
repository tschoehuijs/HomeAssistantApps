FROM ghcr.io/connorgallopo/tracearr:supervised AS upstream

FROM scratch

COPY --from=upstream / /

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

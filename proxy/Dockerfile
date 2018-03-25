FROM alpine:latest
RUN apk --no-cache add \
	squid

## squid
ENV SQUID_CACHE_DIR=/var/spool/squid3 \
    SQUID_LOG_DIR=/var/log/squid

RUN mkdir -p ${SQUID_LOG_DIR}
RUN mkdir -p ${SQUID_CACHE_DIR}
RUN chmod -R 755 ${SQUID_LOG_DIR}

EXPOSE 3128/tcp
VOLUME ["${SQUID_CACHE_DIR}"]

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
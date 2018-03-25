FROM alpine:latest
RUN apk --no-cache add \
	openvpn \
	squid \
	supervisor

## open vpn
RUN mkdir /usr/share/openvpn
RUN cp /etc/openvpn/* /usr/share/openvpn/

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

COPY openvpn-disconnect /usr/bin/openvpn-disconnect
RUN chmod +x /usr/bin/openvpn-disconnect

WORKDIR /etc/openvpn
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
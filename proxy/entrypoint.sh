#!/usr/bin/env ash
set -e

function info() {
  echo -e "[INFO] ${YELLOW}${1}${RESET}"
}

start_squid() {
    info "Starting squid..."
    exec $(which squid) -f /etc/squid/squid.conf -NYCd 1
}


set_cache_peer() {
    echo "\n" >> /etc/squid/squid.conf
    echo "cache_peer ${$PARENT_PROXY_IP} parent ${$PARENT_PROXY_PORT} 0 default no-query" >> /etc/squid/squid.conf
    echo "acl expections dstdomain \"/etc/squit/expections\"" >> /etc/squid/squid.conf
    echo "always_direct allow !exceptions" >> /etc/squid/squid.conf
    echo "never_direct  allow all" >> /etc/squid/squid.conf
}

# todo - check if envs are set and exception file exists before
set_cache_peer


start_squid
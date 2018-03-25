#!/usr/bin/env ash
set -e

function info() {
  echo -e "[INFO] ${YELLOW}${1}${RESET}"
}

start_squid() {
    info "Starting squid..."
    nohup squid -f /etc/squid/squid.conf -YC &>/dev/null &
}

start_squid
if [ "$?" = 0 ]; then
    sleep 2s;
    info "Connecting to vpn..."
    openvpn "$@"
fi
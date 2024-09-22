#!/bin/bash

echo "[#] Setting up Tailscale"

nohup tailscaled --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 &
tailscale up --authkey $TS_AUTHKEY --hostname $TS_HOSTNAME

echo "[#] Tailscale started"

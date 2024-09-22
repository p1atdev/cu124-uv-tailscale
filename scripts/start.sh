#!/bin/bash

echo "[#] Starting..."

cd /

# setup env
echo "[#] Setting up environment..."
bash ./setup-env.sh

# ssh setup
if [[ $PUBLIC_KEY ]]; then
    echo "[#] Setting up SSH..."
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    echo $PUBLIC_KEY >>authorized_keys
    chmod 700 -R ~/.ssh
    cd /
    service ssh start
    echo "[#] SSH started"
else
    echo "[#] WARN: No PUBLIC_KEY provided. You have to login with username and password."
fi

# Tailscale
if [[ $TS_AUTHKEY ]]; then
    cd /
    bash tailscale.sh
    echo "[#] Tailscale started"
else
    echo "[#] No TS_AUTHKEY provided. Set TS_AUTHKEY to connect Tailscale."
fi

# for Tailscale Ephemeral nodes
# ref: https://zenn.dev/platina/scraps/5c968f2cf99eb5

# called on SIGTERM
cleanup() {
    echo "[#] Stopping..."

    if [[ $TS_AUTHKEY ]]; then
        tailscale logout
        echo "[#] Tailscale stopped"
    fi
}

# SIGTERM handler
trap 'cleanup' SIGTERM

# keep running
while true; do
    sleep 1 &
    wait $!
done

exit 0 # never reached

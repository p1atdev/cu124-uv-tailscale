#!/bin/bash

wget https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz

tar -xvf zellij-x86_64-unknown-linux-musl.tar.gz --no-same-owner

mkdir -p /root/.local/bin
mv zellij /root/.local/bin

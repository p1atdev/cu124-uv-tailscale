#!/bin/bash

echo "[#] Setting up uv..."

curl -LsSf https://astral.sh/uv/install.sh | sh

# source rust
. /root/.cargo/env

# python
uv python install 3.11

# install utilities
uv pip install --system ruff hf_transfer huggingface-hub wandb

echo "[#] uv installed"

#!/bin/bash

echo "[#] Setting up uv..."

curl -LsSf https://astral.sh/uv/install.sh | sh

# python
uv python install 3.11

# install utilities
uv tool install hf_transfer ruff
uv tool update-shell

echo "[#] uv installed"

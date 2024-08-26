#!/bin/bash

echo "[#] Setting up starship"

curl -sS https://starship.rs/install.sh | sh -s -- -y

starship_init='

# starship
eval "$(starship init bash)"

'

echo "$starship_init" >>~/.bashrc


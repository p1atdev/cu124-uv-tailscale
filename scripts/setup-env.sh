#!/bin/bash

HF_HOME=/workspace/cache

KYES="

# hf
export HF_HOME=$HF_HOME
export HF_TOKEN=$HF_TOKEN
export HF_HUB_ENABLE_HF_TRANSFER=1

# wandb
export WANDB_API_KEY=$WANDB_API_KEY

"

echo "$KEYS" >>/root/.bashrc

PATHS='
# path
export PATH="$PATH:~/.local/bin"

'

echo "$PATHS" >>/root/.bashrc

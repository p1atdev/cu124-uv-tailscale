#!/bin/bash

HF_HOME=/workspace/cache

ENV_TXT="

# hf
export HF_HOME=$HF_HOME
export HF_TOKEN=$HF_TOKEN
export HF_HUB_ENABLE_HF_TRANSFER=1

# wandb
export WANDB_API_KEY=$WANDB_API_KEY
"

echo "$ENV_TXT" >>/root/.bashrc

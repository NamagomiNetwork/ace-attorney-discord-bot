#!/bin/bash

cat <<EOF | tee /ace-attorney-discord-bot/config.yaml
token: "${TOKEN}"
prefix: "${PREFIX}"
deletionDelay: "0" # if set to 0 (or lower), the deletion queue will be disabled.
max_tasks:
  per_guild: 100
  per_user: 5
EOF
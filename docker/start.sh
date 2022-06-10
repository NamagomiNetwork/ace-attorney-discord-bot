#!/bin/bash
set -e

# configをログに表示しないようにするためscreenを使う

screen -UAmdS config sh /config.sh
sleep 5

cd /ace-attorney-discord-bot || exit

echo "botを起動しています..."
python3 main.py
#!/bin/bash
set -e

# configがなかったら起動を停止
if [ ! -e /config.yaml ];then
    echo "config.yaml が見つかりません。"
    echo "configFileをdocker-composeなどで /config.yaml にマウントしてください"
    echo "configファイルのサンプルは https://github.com/NamagomiNetwork/ace-attorney-discord-bot/blob/main/config.yaml.example を参照してください"
    exit 1
fi

cp /config.yaml /ace-attorney-discord-bot/config.yaml
cd /ace-attorney-discord-bot || exit

python3 main.py
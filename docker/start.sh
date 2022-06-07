#!/bin/bash
set -e

# むりやり日本サーバーに切り替える
echo "160.26.2.187 archive.ubuntu.com" | tee -a /etc/hosts
echo "160.26.2.187 security.ubuntu.com" | tee -a /etc/hosts
# 各種インストール
TZ=Asia/Tokyo
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
apt update && apt upgrade -y
apt install -y python3-pip
apt install ffmpeg -y
apt-get install -y software-properties-common \
    && add-apt-repository ppa:git-core/ppa \
    && apt-get update -y
apt-get install -y git 




# configがなかったら起動を停止
git --version
git clone https://github.com/NamagomiNetwork/ace-attorney-discord-bot.git
cd ace-attorney-discord-bot
cp /config.yaml /ace-attorney-discord-bot/config.yaml
if [ ! -e config.yaml ];then
    echo "config.yaml が見つかりません。"
    echo "configFileをdocker-composeなどで /config.yaml にマウントしてください"
    echo "configファイルのサンプルは https://github.com/NamagomiNetwork/ace-attorney-discord-bot/blob/main/config.yaml.example を参照してください"
    exit 1
fi

python3 -m pip install -r requirements.txt
python3 main.py
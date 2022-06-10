FROM ubuntu:20.04

RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://jp.archive.ubuntu.com/ubuntu/%g" /etc/apt/sources.list
RUN sed -i.bak -e "s%http://security.ubuntu.com/ubuntu/%http://jp.archive.ubuntu.com/ubuntu/%g" /etc/apt/sources.list
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt upgrade -y && apt install -y python3-pip && apt install ffmpeg -y 
RUN apt-get install -y software-properties-common \
    && add-apt-repository ppa:git-core/ppa \
    && apt-get update -y
RUN apt-get install -y git screen
RUN git clone https://github.com/NamagomiNetwork/ace-attorney-discord-bot.git

WORKDIR /ace-attorney-discord-bot
RUN python3 -m pip install -r requirements.txt

WORKDIR /

COPY ./start.sh /start.sh
COPY ./config.sh /config.sh
RUN chmod +x /start.sh && chmod +x /config.sh

ENTRYPOINT [ "/start.sh" ]
FROM dclong/ubuntu_cn

ARG url=https://download.nomachine.com/download/6.3/Linux/nomachine_6.3.6_1_amd64.deb

RUN apt-get update \
    && apt-get install -y \
        lxqt \
        bash-completion man-db \
        firefox \
    && wget $url -O /nomachine.deb \
    && dpkg -i /nomachine.deb \
    && rm /nomachine.deb \
    && mkdir /root/.config \
    && apt-get autoremove \
    && apt-get autoclean

EXPOSE 4000

COPY scripts /scripts

ENTRYPOINT ["/scripts/init.sh"]

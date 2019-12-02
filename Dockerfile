FROM dclong/ubuntu_cn

ARG version=6.8.1_1
# Bash substring does NOT work here!!!
ARG ver=6.8 
ARG url=https://download.nomachine.com/download/${ver}/Linux/nomachine_${version}_amd64.deb

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        lxqt \
        firefox \
    && curl -sSL $url -o /nomachine.deb \
    && dpkg -i /nomachine.deb \
    && rm /nomachine.deb \
    && mkdir /root/.config \
    && apt-get autoremove \
    && apt-get autoclean

EXPOSE 4000

COPY scripts /scripts

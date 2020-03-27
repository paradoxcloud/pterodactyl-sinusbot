FROM        ubuntu:16.04

MAINTAINER  paradox.cloud, <support@paradox.network>
ENV         DEBIAN_FRONTEND noninteractive

RUN         apt-get update \
            && apt-get upgrade -y \
            && apt-get install -y python libglib2.0-0 x11vnc xvfb libxcursor1 ca-certificates curl bzip2 libnss3 libegl1-mesa x11-xkb-utils libasound2 libpci3 libxslt1.1 libxkbcommon0 libxss1 libxcomposite1 \
            && update-ca-certificates \
            && useradd -m -d /home/container container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]

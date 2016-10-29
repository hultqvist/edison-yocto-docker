FROM edison/ubuntu-build

MAINTAINER hultqvist@silentorbit.com

RUN adduser --disabled-password edison

RUN rm /bin/sh           && \
    ln /bin/bash /bin/sh

WORKDIR /home/edison
USER    edison

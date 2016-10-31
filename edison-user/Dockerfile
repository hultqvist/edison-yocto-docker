FROM edison/ubuntu-build

MAINTAINER hultqvist@silentorbit.com

ENV TERM=xterm-256color

RUN adduser --disabled-password edison

RUN rm /bin/sh           && \
    ln /bin/bash /bin/sh

ADD bashrc.txt /home/edison/.bashrc
ADD inputrc.txt /home/edison/.inputrc

RUN chown -R edison.edison /home/edison/

WORKDIR /home/edison
USER    edison

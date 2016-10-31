FROM edison/source

MAINTAINER hultqvist@silentorbit.com

WORKDIR /home/edison/poky

RUN source ./oe-init-build-env ../build_edison/     && \
    bitbake -c fetchall edison-image u-boot

WORKDIR /home/edison

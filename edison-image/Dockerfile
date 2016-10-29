FROM edison/download

MAINTAINER hultqvist@silentorbit.com

WORKDIR /home/edison/iot-devkit-edison/$YOCTO/poky

RUN source ./oe-init-build-env ../build_edison/          && \
    bitbake edison-image u-boot                          && \
    ../poky/meta-intel-edison/utils/flash/postBuild.sh . && \
    zip -r /home/edison/toFlash.zip toFlash

WORKDIR /home/edison

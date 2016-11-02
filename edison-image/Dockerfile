FROM edison/download

MAINTAINER hultqvist@silentorbit.com

WORKDIR /home/edison/poky

RUN source ./oe-init-build-env ../build_edison/            && \
    bitbake edison-image u-boot                            && \
    ../poky/meta-intel-edison/utils/flash/postBuild.sh .   && \
	cd toFlash                                             && \
    zip -r /home/edison/toFlash.zip *

WORKDIR /home/edison

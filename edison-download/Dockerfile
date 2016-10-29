FROM edison/source

MAINTAINER hultqvist@silentorbit.com

WORKDIR /home/edison/iot-devkit-edison/$YOCTO/poky

RUN	mkdir -p /home/edison/bitbake/download/ /home/edison/bitbake/sstate/
RUN	./meta-intel-edison/setup.sh \
        --parallel_make=8 --bb_number_thread=8	\
        --dl_dir=/home/edison/bitbake/download/ \
        --sstate_dir=/home/edison/bitbake/sstate/

WORKDIR /home/edison/iot-devkit-edison/$YOCTO/poky/out/linux64		

RUN	source poky/oe-init-build-env				&& \
	bitbake -c fetchall edison-image u-boot

WORKDIR /home/edison




FROM edison/user

MAINTAINER hultqvist@silentorbit.com

ENV YOCTO=iot-devkit-yp-poky-edison-20160606

#Download directly from intel
#RUN	wget http://iotdk.intel.com/src/3.5/edison/$YOCTO.zip && \
#	unzip $YOCTO.zip                                      && \
#	rm $YOCTO.zip

#Use local .zip previously downloaded
COPY $YOCTO.zip /home/edison/
RUN	unzip $YOCTO.zip     && \
	rm $YOCTO.zip        && \
	mv $YOCTO/* ~/       && \
	rmdir $YOCTO/

ADD local.conf /home/edison/build_edison/conf/local.conf
ADD auto.conf  /home/edison/build_edison/conf/auto.conf
ADD edison-image.bb       /home/edison/poky/meta-intel-edison/meta-intel-edison-distro/recipes-core/images/edison-image.bb
ADD edison-image.bbappend /home/edison/poky/meta-intel-iot-devkit/recipes-core/images/edison-image.bbappend

USER root
RUN chown -R edison.edison /home/edison/
USER edison

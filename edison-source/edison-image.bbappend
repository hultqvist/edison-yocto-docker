
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

#IMAGE_INSTALL += "wyliodrin-server"
#IMAGE_INSTALL += "openjdk-8-jdk"
#IMAGE_INSTALL += "tinyb"
#IMAGE_INSTALL += "tinyb-dev"
#IMAGE_INSTALL += "git"
#IMAGE_INSTALL += "python-pip"
#IMAGE_INSTALL += "vim"
IMAGE_INSTALL += "nano"
#IMAGE_INSTALL += "links"

#IMAGE_INSTALL += "iotivity"
#IMAGE_INSTALL += "iotivity-dev"
#IMAGE_INSTALL += "iotivity-tests"
#IMAGE_INSTALL += "iotivity-plugins-staticdev"
#IMAGE_INSTALL += "iotivity-plugins-samples"
#IMAGE_INSTALL += "iotivity-resource"
#IMAGE_INSTALL += "iotivity-resource-dev"
#IMAGE_INSTALL += "iotivity-resource-thin-staticdev"
#IMAGE_INSTALL += "iotivity-resource-samples"
#IMAGE_INSTALL += "iotivity-service"
#IMAGE_INSTALL += "iotivity-service-dev"
#IMAGE_INSTALL += "iotivity-service-staticdev"
#IMAGE_INSTALL += "iotivity-service-samples"
#IMAGE_INSTALL += "iotivity-simple-client"
#IMAGE_INSTALL += "iotivity-sensorboard"

ROOTFS_POSTPROCESS_COMMAND_append += "install_edison_repo ;"
#ROOTFS_POSTPROCESS_COMMAND_append += "symlink_node_modules ;"

MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-rtl8150"

install_edison_repo() {
  echo "src iotkit http://iotdk.intel.com/repos/3.5/intelgalactic/opkg/i586/" > ${IMAGE_ROOTFS}/etc/opkg/iotkit.conf
  echo "src iotdk-all http://iotdk.intel.com/repos/3.5/iotdk/edison/all" >> ${IMAGE_ROOTFS}/etc/opkg/iotkit.conf
  echo "src iotdk-core2-32 http://iotdk.intel.com/repos/3.5/iotdk/edison/core2-32" >> ${IMAGE_ROOTFS}/etc/opkg/iotkit.conf
  echo "src iotdk-edison http://iotdk.intel.com/repos/3.5/iotdk/edison/edison" >> ${IMAGE_ROOTFS}/etc/opkg/iotkit.conf

  # Overwrite /etc/release (remove intel copyright) per Brendan
  echo "EDISON-3.5" > ${IMAGE_ROOTFS}/etc/release

  # Add volatile log
  echo "d /var/volatile/log - - - -" >> ${IMAGE_ROOTFS}/etc/tmpfiles.d/00-create-volatile.conf

  # Use PAM configuration from chgpasswd for chpasswd
  cp -f ${IMAGE_ROOTFS}/etc/pam.d/chgpasswd ${IMAGE_ROOTFS}/etc/pam.d/chpasswd

  # Do not use PAM for SSH
  sed -i'' 's/^UsePAM yes/#UsePAM yes/' ${IMAGE_ROOTFS}/etc/ssh/sshd_config

  # Enable DHCP client for usb ethernet via systemd
  echo "[Match]" >> ${IMAGE_ROOTFS}/etc/systemd/network/enp0.network
  echo "Name=enp0*" >> ${IMAGE_ROOTFS}/etc/systemd/network/enp0.network
  echo "[Network]" >> ${IMAGE_ROOTFS}/etc/systemd/network/enp0.network
  echo "DHCP=yes" >> ${IMAGE_ROOTFS}/etc/systemd/network/enp0.network
  chmod 0644 ${IMAGE_ROOTFS}/etc/systemd/network/enp0.network
}

#symlink_node_modules() {
#  # Create simlink from /usr/lib/node_modules/ to /usr/lib/node/ as different
#  # people seem to want different paths
#  cd ${IMAGE_ROOTFS}/usr/lib/; ln -s node_modules node
#}

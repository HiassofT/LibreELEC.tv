# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="slice-drivers"
PKG_VERSION="4ffea43af96caab775a131ef98f5df3f2cc386e3"
PKG_SHA256="fe370fdf4c387e96231da39862473f2d321ea67cda9fa22b2afe05dd0048e93d"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/HiassofT/slice-drivers"
PKG_URL="https://github.com/HiassofT/slice-drivers/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="linux kernel modules for the Slice box"
PKG_IS_KERNEL_PKG="yes"

make_target() {
  local kdir=$(kernel_path)
  local dtc=${kdir}/scripts/dtc/dtc
  kernel_make KDIR=${kdir} DTC=${dtc} modules overlays
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    kernel_make KDIR=$(kernel_path) DESTDIR="${INSTALL}/$(get_full_module_dir)/${PKG_NAME}" modules_install
  mkdir -p ${INSTALL}/usr/share/bootloader/overlays
    cp *.dtbo ${INSTALL}/usr/share/bootloader/overlays
}

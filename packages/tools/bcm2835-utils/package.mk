# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2023-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="bcm2835-utils"
PKG_VERSION="f05576876184fa62acf8ffa5585f2484a988d1d1"
PKG_SHA256="81834504a3ba2d89aa3b79dc56130d5244d9619a57c5bbf2ecf60e4c873c809e"
PKG_ARCH="arm aarch64"
PKG_LICENSE="BSD-3-Clause"
PKG_SITE="https://github.com/raspberrypi/utils"
PKG_URL="https://github.com/raspberrypi/utils/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="gcc:host"
PKG_LONGDESC="Raspberry Pi related collection of scripts and simple applications"
PKG_TOOLCHAIN="cmake"

# only going to use vclog so don't build everything else
make_target() {
  mkdir -p ${PKG_BUILD}/.${TARGET_NAME}/vclog/build
  cd ${PKG_BUILD}/.${TARGET_NAME}/vclog/build
  cmake -S ${PKG_BUILD}/vclog
  make
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp -PRv ${PKG_BUILD}/.${TARGET_NAME}/vclog/build/vclog ${INSTALL}/usr/bin
}

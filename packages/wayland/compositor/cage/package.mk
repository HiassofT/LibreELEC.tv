# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2026-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="cage"
PKG_VERSION="0.2.1"
PKG_SHA256="acab0c83175164a788d7b9f89338cbdebdc4f7197aff6fdc267c32f7181234a9"
PKG_LICENSE="MIT"
PKG_SITE="https://www.hjdskes.nl/projects/cage"
PKG_URL="https://github.com/cage-kiosk/cage/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain wayland wayland-protocols libxkbcommon wlroots kanshi"
PKG_LONGDESC="A Wayland kiosk "

PKG_MESON_OPTS_TARGET="-Dman-pages=disabled"

post_makeinstall_target() {
  mkdir -p "${INSTALL}/usr/bin"
    cp "${PKG_DIR}/scripts/start-wayland-session" "${INSTALL}/usr/bin"

  mkdir -p "${INSTALL}/usr/lib/libreelec"
    cp "${PKG_DIR}/scripts/wayland-session-helper" "${INSTALL}/usr/lib/libreelec"
}

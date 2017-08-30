################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="dvb.crazycat"
PKG_VERSION="2017-06-20-rpi"
PKG_SHA256="ff30bf1ee9fe342649ad80c9072ab4d37238d05680da850828f6d6c1d6b2e6d4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/crazycat69/linux_media"
PKG_URL="$DISTRO_SRC/media_build-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_BUILD_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="CrazyCats DVB driver for TBS cards and other experimental drivers."
PKG_LONGDESC="CrazyCats DVB driver for TBS cards and other experimental drivers."
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="DVB drivers for TBS (CrazyCat)"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

unpack() {
  mkdir -p $PKG_BUILD
  tar Jxf $ROOT/$SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz \
    --strip-components=1 \
    -C $PKG_BUILD
}

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  make untar

  # copy config file
  if [ "$PROJECT" = Generic ] || [ "$PROJECT" = Virtual ]; then
    if [ -f $PKG_DIR/config/generic.config ]; then
      cp $PKG_DIR/config/generic.config v4l/.config
    fi
  else
    if [ -f $PKG_DIR/config/usb.config ]; then
      cp $PKG_DIR/config/usb.config v4l/.config
    fi
  fi

  # add menuconfig to edit .config
  make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  MODULE_DIR="$INSTALL/$(get_full_module_dir $PKG_ADDON_ID)/updates/$PKG_ADDON_ID"
  ADDON_DIR="$INSTALL/usr/share/$MEDIACENTER/addons/$PKG_ADDON_ID"

  mkdir -p $MODULE_DIR
  find $PKG_BUILD/v4l/ -name \*.ko -exec cp {} $MODULE_DIR \;

  find $MODULE_DIR -name \*.ko -exec $STRIP --strip-debug {} \;

  mkdir -p $ADDON_DIR
  cp $PKG_DIR/changelog.txt $ADDON_DIR
  install_addon_files "$ADDON_DIR"
}

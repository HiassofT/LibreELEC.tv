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

PKG_NAME="dvb.crazycat.previous"
PKG_VERSION="9.0.0"
PKG_SHA256="db19a2be3c1e57fe92a3f39b0af1c1925765d24dd1697ccb9d8be0f9fb84de13"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL="http://addons.libreelec.tv/${ADDON_VERSION}/${DEVICE:-$PROJECT}/${ARCH}/driver.dvb.crazycat/driver.dvb.crazycat-${PKG_VERSION}.zip"
PKG_SOURCE_DIR="driver.dvb.crazycat"
PKG_SOURCE_NAME="${PKG_NAME}-${DEVICE:-$PROJECT}-${PKG_VERSION}.zip"
PKG_SHORTDESC="Previous version of CrazyCats DVB driver"
PKG_LONGDESC="Previous version of CrazyCats DVB driver"
PKG_AUTORECONF="no"

make_target() {
  :
}

makeinstall_target() {
  :
}

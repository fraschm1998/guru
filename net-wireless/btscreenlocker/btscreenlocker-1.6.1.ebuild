# Copyright 2024 Brayan M. Salazar <this.brayan@proton.me>
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Daemon to lock your screen when Bluetooth trusted devices go away."
HOMEPAGE="https://github.com/brookiestein/BtScreenLocker"
SRC_URI="https://github.com/brookiestein/BtScreenLocker/archive/refs/tags/${PV}.tar.gz -> BtScreenLocker-${PV}.tar.gz"
S="${WORKDIR}/BtScreenLocker-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
dev-qt/qtbluetooth:5
dev-qt/qtdbus:5
dev-qt/qtwidgets:5
dev-qt/linguist-tools:5
>=net-wireless/bluez-5.76
"
RDEPEND="${DEPEND}"
BDEPEND="
virtual/pkgconfig
>=dev-build/cmake-3.28
"

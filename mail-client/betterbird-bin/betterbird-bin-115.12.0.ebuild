# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

DESCRIPTION="Betterbird is a fine-tuned version of Mozilla Thunderbird."
HOMEPAGE="https://github.com/Betterbird/thunderbird-patches https://betterbird.eu/"
SRC_URI="amd64? ( https://www.betterbird.eu/downloads/LinuxArchive/betterbird-${PV}-bb29.en-US.linux-x86_64.tar.bz2 )"

S="${WORKDIR}"
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="-* ~amd64"

RESTRICT="bindist mirror test strip"

RDEPEND="
	dev-libs/dbus-glib
"

QA_PREBUILT="*"

src_install() {
	insinto /opt/
	doins -r "${S}"/betterbird

	dosym "../../opt/betterbird/betterbird-bin" /usr/bin/betterbird-bin
	domenu "${FILESDIR}"/betterbird-bin.desktop
	local x
	for x in 16 32 48 64 128 256; do
		newicon -s ${x} "${S}"/betterbird/chrome/icons/default/default${x}.png betterbird.png
	done

	fperms +x "/opt/betterbird/betterbird-bin"
}

pkg_postinst() {
	elog "Language pack XPIs need to be downloaded and installed manually."
	elog "Please see the link below for further information."
	elog ""
	elog "\thttps://betterbird.eu/downloads/index.php"
}
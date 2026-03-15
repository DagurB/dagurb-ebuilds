# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# ebuild file largely inspired by hyproverlay's hyprlock ebuild file

EAPI=8

inherit cmake

DESCRIPTION="A multipurpose and versatile launcher / picker for Hyprland"
HOMEPAGE="https://github.com/hyprwm/hyprlauncher"
SRC_URI=""

if [[ "${PV}" = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hyprwm/${PN^}.git"
else
	SRC_URI="https://github.com/hyprwm/${PN^}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi


LICENSE="BSD"
SLOT="0"

# This may include dependencies which aren't strictly necessary. This is because I kind of guessed which librararies would be needed.
DEPEND="
	>=dev-libs/hyprlang-0.6.0
	>=gui-libs/hyprutils-0.8.0:=
	dev-libs/icu
	gui-libs/hyprtoolkit
	gui-libs/hyprwire
	sci-libs/libqalculate
	x11-libs/libdrm
	x11-libs/pixman
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/hyprwayland-scanner
	virtual/pkgconfig
"

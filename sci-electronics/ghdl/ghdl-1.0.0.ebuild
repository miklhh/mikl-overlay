# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ADA_COMPAT=( gnat_20{20..21} )
inherit ada multilib

DESCRIPTION="VHDL 2008/93/87 simulator"
HOMEPAGE="https://github.com/ghdl/ghdl"
SRC_URI="https://github.com/ghdl/ghdl/archive/refs/tags/v${PV}.tar.gz"
RESTRICT="nomirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

REQUIRED_USE="${ADA_REQUIRED_USE}"
DEPEND="
	>=sys-devel/llvm-3.5
	>=sys-devel/clang-3.5
	${ADA_DEPS}
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e 's#$(prefix)/lib$#$(prefix)/'"$(get_libdir)"'#g' -i "${S}/Makefile.in" \
		|| die 'unable to fix library install path'
}

src_configure() {
	ada_setup
	./configure --prefix="${EPREFIX}/usr" || die "Failed to configure"
}


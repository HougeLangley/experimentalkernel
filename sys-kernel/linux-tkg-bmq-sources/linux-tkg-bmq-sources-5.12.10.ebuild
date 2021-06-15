# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Define what default functions to run
ETYPE="sources"

# No 'experimental' USE flag provided, but we still want to use genpatches
K_EXP_GENPATCHES_NOUSE="1"

# Just get basic genpatches, -xanmod patch set already includes main updates
K_GENPATCHES_VER="1"

# -linux-tkg-bmq-sources already sets EXTRAVERSION to kernel Makefile
K_NOSETEXTRAVERSION="1"

# Not supported by the Gentoo security team
K_SECURITY_UNSUPPORTED="1"

# We want the very basic patches from gentoo-sources, experimental patch is
# already included in -linux-tkg-bmq-sources
K_WANT_GENPATCHES="base extras"

DEPEND="dev-util/pahole
dev-libs/libbpf
"

inherit kernel-2
detect_version

DESCRIPTION="Linux-TkG, BMQ, cjktty, uksm patchset for main kernel tree"
HOMEPAGE="https://github.com/Frogging-Family/linux-tkg"
LICENSE+=" CDDL"
SRC_URI="
${KERNEL_BASE_URI}/linux-5.12.10.tar.xz
${GENPATCHES_URI}
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0001-mm-Support-soft-dirty-flag-reset-for-VA-range.patch
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0002-clear-patches.patch
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0003-glitched-base.patch
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0006-add-acs-overrides_iommu.patch
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0007-v5.12-fsync.patch
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0007-v5.12-futex2_interface.patch
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0007-v5.12-winesync.patch
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0009-glitched-ondemand-bmq.patch
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0009-glitched-bmq.patch
https://raw.githubusercontent.com/Frogging-Family/linux-tkg/master/linux-tkg-patches/5.12/0009-prjc_v5.12-r1.patch
https://github.com/HougeLangley/customkernel/releases/download/v5.12-others/v1-cjktty.patch
https://github.com/HougeLangley/customkernel/releases/download/v5.12-others/v1-uksm.patch
"
KEYWORDS="~amd64"

S="${WORKDIR}/linux-5.12.10-linux"

UNIPATCH_STRICTORDER=( "${DISTDIR}/0001-mm-Support-soft-dirty-flag-reset-for-VA-range.patch"
"${DISTDIR}/0002-clear-patches.patch"
"${DISTDIR}/0003-glitched-base.patch"
"${DISTDIR}/0006-add-acs-overrides_iommu.patch"
"${DISTDIR}/0007-v5.12-fsync.patch"
"${DISTDIR}/0007-v5.12-futex2_interface.patch"
"${DISTDIR}/0007-v5.12-winesync.patch"
"${DISTDIR}/0009-glitched-ondemand-bmq.patch"
"${DISTDIR}/0009-glitched-bmq.patch"
"${DISTDIR}/0009-prjc_v5.12-r1.patch"
"${DISTDIR}/v1-cjktty.patch"
"${DISTDIR}/v1-uksm.patch" )

K_EXTRAEINFO="For more info on linux-tkg-bmq-sources and details on how to report problems, see: ${HOMEPAGE}."

pkg_setup() {
	ewarn ""
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the ${HOMEPAGE} directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn ""

	kernel-2_pkg_setup
}

pkg_postinst() {
	elog "MICROCODES"
	elog "Use linux-tkg-bmq-sources with microcodes"
	elog "Read https://wiki.gentoo.org/wiki/Intel_microcode"
}

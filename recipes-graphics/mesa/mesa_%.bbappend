FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:${THISDIR}/files:"

# Enable freedreno driver
PACKAGECONFIG_FREEDRENO = "\
    freedreno \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xa', '', d)} \
"

PACKAGECONFIG_append_qcom = "${PACKAGECONFIG_FREEDRENO}"

# Add support to build mesa dev
BBCLASSEXTEND = "devupstream:target"
SRC_URI_class-devupstream = "git://gitlab.freedesktop.org/mesa/mesa.git;protocol=https \
    file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
    file://0002-meson.build-make-TLS-ELF-optional.patch \
    file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
    file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
"
LIC_FILES_CHKSUM_class-devupstream = "file://docs/license.rst;md5=9aa1bc48c9826ad9fdb16661f6930496"

SRCREV_class-devupstream = "13f92183c7dbff9d76a83656862d0b2c2536e25d"

PLATFORMS_remove_class-devupstream = "drm surfaceless"
PACKAGECONFIG_class-devupstream[osmesa] = "-Dosmesa=true,-Dosmesa=false"

PV_class-devupstream = "20.4-dev+git${SRCPV}"

# Add package to install require files to run tests for mesa
PACKAGES_class-devupstream =+ "mesa-ci"
FILES_${PN}-ci_class-devupstream = "${bindir}/deqp-runner.sh ${datadir}/mesa/deqp-*"
do_install_append_class-devupstream () {
    install -d ${D}/${datadir}/mesa

    install -m 0644 ${S}/ci-expects/default/deqp-default-skips.txt ${D}/${datadir}/mesa/
    for f in ${S}/ci-expects/freedreno/deqp-freedreno-*; do
        install -m 0644 $f ${D}/${datadir}/mesa/
    done

    install -d ${D}/${bindir}
    install -m 0755 ${S}/.gitlab-ci/deqp-runner.sh ${D}/${bindir}/
}

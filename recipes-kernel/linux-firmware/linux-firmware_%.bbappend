PACKAGE_ARCH:ti-am62 = "${MACHINE_ARCH}"

do_install:append:ti-am62() {
	mv -f ${D}${nonarch_base_libdir}/firmware/cnm/wave521c_k3_codec_fw.bin ${D}${nonarch_base_libdir}/firmware/cnm/wave521c_codec_fw.bin
	ln -sf ./cnm/wave521c_codec_fw.bin ${D}${nonarch_base_libdir}/firmware/wave521c_codec_fw.bin
}

FILES:${PN}-wave521c_codec_fw:ti-am62 = "\
        ${nonarch_base_libdir}/firmware/wave521c_codec_fw.bin \
"

COMPATIBLE_MACHINE:ti-am62 = "ti-am62"

LICENCE:${PN}:append:ti-am62 = "\
        & Firmware-cnm \
"

LICENCE:append:ti-am62 = "\
        & Firmware-cnm \
"

FILES:${PN}-cnm:ti-am62 = " \
  ${nonarch_base_libdir}/firmware/cnm/wave521c_codec_fw.bin \
"

FILES:${PN}-cnm-licence:ti-am62 = " \
  ${nonarch_base_libdir}/firmware/LICENCE.cnm \
"

RDEPENDS:${PN}-cnm:ti-am62 += "${PN}-cnm-licence ${PN}-wave521c_codec_fw"
LICENCE:${PN}-cnm:ti-am62             = "Firmware-cnm"
LICENCE:${PN}-cnm-licence:ti-am62  = "Firmware-cnm"

PACKAGES:prepend:ti-am62 = "\
	${PN}-cnm \
	${PN}-cnm-licence \
	${PN}-wave521c_codec_fw \
	"

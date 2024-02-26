FILESEXTRAPATHS:prepend:ti-am62 := "${THISDIR}/${PN}:"

OPTEEOUTPUTMACHINE:ti-am62 = "k3"

FILES:${PN}:ti-am62 += "/lib/firmware/* \
		      /usr/lib/firmware/*"

COMPATIBLE_MACHINE:ti-am62 = "ti-am62"

DEPENDS:append:ti-am62 = " python3-cryptography-native"

EXTRA_OEMAKE:remove:ti-am62 = "CFG_MAP_EXT_DT_SECURE=y"
EXTRA_OEMAKE:append:ti-am62 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
EXTRA_OEMAKE:append:ti-am62 = " CFG_TEE_CORE_LOG_LEVEL=1"

do_compile:append:ti-am62() {
    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
    cp ${B}/core/tee.elf ${B}/bl32.elf
}

do_install:append:ti-am62() {
    install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
    install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
    install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true

    # Install embedded TAs
    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
    install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
}

do_deploy:append:ti-am62() {
    ln -sf optee/bl32.bin ${DEPLOYDIR}/
    ln -sf optee/bl32.elf ${DEPLOYDIR}/
}

FILES:${PN}:ti-am62 += "${nonarch_base_libdir}/optee_armtz/"

INSANE_SKIP:${PN}:append:ti-am62 = " textrel"

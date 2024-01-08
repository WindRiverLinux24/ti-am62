COMPATIBLE_MACHINE:ti-am62 = "ti-am62"

PLAT_SFX:ti-am62 = "am62axx"

PRUETH_FW_AM65X_SR2_VERSION:ti-am62 = "02.02.12.08"
CNM_WAVE521_FW_VERSION:ti-am62 = "1.0.3"
TI_SYSFW_VERSION:ti-am62 = "09.01.08"

TI_LINUX_FW_SRCREV:ti-am62 = "9ee2fedb1fb4815f54310dd872d34faf9948c7c1"

FILES:${PN}:ti-am62 += "${nonarch_base_libdir}"

IPC_FW_LIST:ti-am62 = " ${MCU_2_0_FW} ${C7X_1_FW}"

ALTERNATIVE:${PN}:ti-am62 = "\
                    am62a-mcu-r5f0_0-fw   am62a-mcu-r5f0_0-fw-sec \
                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
                    "

DEPENDS:append:ti-am62 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
TI_K3_SECDEV_INSTALL_DIR:ti-am62 = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
TI_SECURE_DEV_PKG:ti-am62 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"

do_install:prepend:ti-am62() {
        ( cd ${S}/${IPC_FW_DIR}; \
                ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
        )          
} 

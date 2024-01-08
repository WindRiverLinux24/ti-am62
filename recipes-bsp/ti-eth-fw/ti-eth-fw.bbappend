COMPATIBLE_MACHINE:ti-am62 = "ti-am62"

PLAT_SFX:ti-am62 = "am62axx"

ETH_FW_LIST:ti-am62 =  ""

DEPENDS:append:ti-am62 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
TI_K3_SECDEV_INSTALL_DIR:ti-am62 = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
TI_SECURE_DEV_PKG:ti-am62 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"

COMPATIBLE_MACHINE:am62axx-evm = "am62axx-evm"
DEPENDS:append:am62axx-evm = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
TI_K3_SECDEV_INSTALL_DIR:am62axx-evm = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
TI_SECURE_DEV_PKG:am62axx-evm = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"

FW_DIR:am62axx-evm = "${PLAT_SFX}/vision_apps_eaik"
INSTALL_FW_DIR:am62axx-evm = "${nonarch_base_libdir}/firmware/vision_apps_eaik/"

SSTATE_ALLOW_OVERLAP_FILES:am62axx-evm += "${DEPLOY_DIR_IMAGE}/ti-dm"

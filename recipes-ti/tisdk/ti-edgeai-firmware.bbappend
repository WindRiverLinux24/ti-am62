COMPATIBLE_MACHINE:am62axx-evm = "am62axx-evm"

FW_DIR:am62axx-evm = "${PLAT_SFX}/vision_apps_eaik"
INSTALL_FW_DIR:am62axx-evm = "${nonarch_base_libdir}/firmware/vision_apps_eaik/"

SSTATE_ALLOW_OVERLAP_FILES:am62axx-evm += "${DEPLOY_DIR_IMAGE}/ti-dm"

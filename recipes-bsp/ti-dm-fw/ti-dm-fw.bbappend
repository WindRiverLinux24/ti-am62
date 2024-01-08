COMPATIBLE_MACHINE:ti-am62 = "ti-am62"

PLAT_SFX = ""
PLAT_SFX:ti-am62 = "am62axx"
TI_DM_FW_VERSION:ti-am62 = "09.01.02"
TI_SYSFW_VERSION:ti-am62 = "09.01.08"
TI_LINUX_FW_SRCREV:ti-am62 = "9ee2fedb1fb4815f54310dd872d34faf9948c7c1"

DM_FW_LIST:ti-am62 = "${DM_FIRMWARE}"

IPC_DM_FW:ti-am62 = "ipc_echo_testb_mcu1_0_release_strip.xer5f"

# Set up names for the firmwares
ALTERNATIVE:${PN}:ti-am62 = "am62a-main-r5f0_0-fw"

DEPENDS:append:ti-am62 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
TI_K3_SECDEV_INSTALL_DIR:ti-am62 = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
TI_SECURE_DEV_PKG:ti-am62 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"


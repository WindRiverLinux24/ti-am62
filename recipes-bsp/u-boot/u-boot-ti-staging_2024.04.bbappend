COMPATIBLE_MACHINE:ti-am62 = "ti-am62"
COMPATIBLE_MACHINE:ti-am62-k3r5 = "ti-am62-k3r5"
SPL_BINARY:ti-am62 = "tispl.bin"
PACKAGECONFIG:append:ti-am62 = " atf optee dm"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SYSFW_SUFFIX = "${@bb.utils.contains("MACHINE_FEATURES", "secure-boot", "hs", "hs-fs", d)}"
SRC_URI:append:ti-am62-k3r5 = " \
    file://0001-arm-dts-k3-binman-create-a-symlink-file-pointing-to-.patch \
"

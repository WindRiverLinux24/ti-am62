FILESEXTRAPATHS:prepend:ti-am62 := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE:ti-am62 = "ti-am62"

SRC_URI:append:ti-am62 = " \
    file://0001-Adding-support-for-raw10-raw12-and-raw16-bayer-formats.patch \
    file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
    file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
    file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
    file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
"

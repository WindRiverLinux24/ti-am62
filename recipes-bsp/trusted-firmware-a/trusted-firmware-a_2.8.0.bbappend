FILES:${PN}:ti-am62 += "/firmware/*"

COMPATIBLE_MACHINE:ti-am62 = "ti-am62"

PV:ti-am62 = "2.9+git${SRCPV}"
SRCREV_tfa:ti-am62 = "d7a7135d32a8c7da004c0c19b75bd4e2813f9759"
SRC_URI:ti-am62 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
TFA_BUILD_TARGET:ti-am62 = "all"
TFA_INSTALL_TARGET:ti-am62 = "bl31"
TFA_SPD:ti-am62 = "opteed"
TFA_PLATFORM:ti-am62 = "k3"

EXTRA_OEMAKE:append:ti-am62 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
EXTRA_OEMAKE:append:ti-am62 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"

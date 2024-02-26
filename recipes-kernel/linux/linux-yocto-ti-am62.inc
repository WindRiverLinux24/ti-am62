#
# Copyright (C) 2024 Wind River Systems, Inc.
#

COMPATIBLE_MACHINE:ti-am62 = "ti-am62"
TARGET_SUPPORTED_KTYPES:ti-am62 = "standard preempt-rt"

KERNEL_DTC_FLAGS:append:ti-am62 = " -@"

include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
TI_SECDEV = "${@bb.utils.contains("MACHINE_FEATURES", "secure-boot", "ti-secdev", "", d)}"
inherit ${TI_SECDEV}

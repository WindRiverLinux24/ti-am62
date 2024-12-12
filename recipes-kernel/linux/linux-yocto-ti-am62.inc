#
# Copyright (C) 2024 Wind River Systems, Inc.
#

COMPATIBLE_MACHINE = "ti-am62"
TARGET_SUPPORTED_KTYPES = "standard preempt-rt"

KERNEL_DTC_FLAGS:append = " -@"

include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
inherit ${@bb.utils.contains("MACHINE_FEATURES", "secure-boot", "ti-secdev", "", d)}

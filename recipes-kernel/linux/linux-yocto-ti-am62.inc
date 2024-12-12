#
# Copyright (C) 2024 Wind River Systems, Inc.
#

COMPATIBLE_MACHINE = "ti-am62"
TARGET_SUPPORTED_KTYPES = "standard preempt-rt"

KERNEL_DTC_FLAGS:append = " -@"

#@TYPE: Machine inc.
#@NAME: ti-am62-extra

# All the device trees for am62ax platform
KERNEL_DEVICETREE_PREFIX = "ti/k3-am62a7 ti/k3-am62x-sk ti/k3-fpdlink"

# Add extra essential overrides
MACHINEOVERRIDES:prepend = "k3:am62axx:"

# Multiconfig Setting
BBMULTICONFIG += "k3r5"

# Select expected version for u-boot-tools package
PREFERRED_VERSION_u-boot-tools-native ?= "2023.01"

# Enable support for fitImage
KERNEL_IMAGETYPES = "Image fitImage"
KERNEL_CLASSES += "kernel-fitimage"
UBOOT_ENTRYPOINT = "0x81000000"
UBOOT_LOADADDRESS = "0x81000000"
UBOOT_RD_LOADADDRESS = "0x84000000"
UBOOT_RD_ENTRYPOINT = "0x84000000"
UBOOT_DTB_LOADADDRESS = "0x83000000"
UBOOT_DTBO_LOADADDRESS = "0x83080000"

# SPL binary related parameters
SPL_BINARY = "tispl.bin"
SPL_BINARYNAME = "tispl.bin"
UBOOT_SUFFIX = "img"

# Enable kernel signature
UBOOT_SIGN_ENABLE = "1"
UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
UBOOT_SIGN_KEYNAME ?= "custMpk"
UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
FIT_HASH_ALG ?= "sha512"
FIT_SIGN_ALG ?= "rsa4096"
# UBOOT_SIGN_IMG_KEYNAME is set, so generate it automatically.
# This is an improvement for TI kernel signature strategy.
FIT_GENERATE_KEYS = "1"
FIT_SIGN_INDIVIDUAL = "1"
UBOOT_SIGN_IMG_KEYNAME = "custMpkImage"

# ATF parameters
TFA_PLATFORM = "k3"
TFA_K3_SYSTEM_SUSPEND = "1"
TFA_BOARD = "lite"
OPTEEMACHINE = "k3-am62x"

# Install essential bootloader images
IMAGE_BOOT_FILES:append = " ${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
# Default tiboot3.bin on AM62A is for HS-FS
IMAGE_BOOT_FILES:append = " tiboot3-am62ax-hs-fs-evm.bin"
# Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
IMAGE_BOOT_FILES:append = " tiboot3-am62ax-gp-evm.bin"
# Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
IMAGE_BOOT_FILES:append = " tiboot3-am62ax-hs-evm.bin"
# Install fitImage
IMAGE_INSTALL:append = " kernel-image-fitimage"
IMAGE_BOOT_FILES:append = " fitImage"

# Set the dependency of generating wic image.
do_image_wic[depends] += "u-boot-ti-staging:do_deploy"
do_image[mcdepends] += "mc::k3r5:u-boot-ti-staging:do_deploy"

# remove trusted-firmware-a-ti.inc quotation, because there are same configurations in the bbappend of BSP layer
TFA_TI:remove = "trusted-firmware-a-ti.inc"

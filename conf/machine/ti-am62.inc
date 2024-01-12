#@TYPE: Machine inc.
#@NAME: ti-am62

DEFAULTTUNE = "cortexa53"
require conf/machine/include/arm/armv8a/tune-cortexa53.inc

MACHINE_FEATURES += "ext3 pci usbgadget usbhost vfat keyboard network"

DISTRO_FEATURES:append = " vfat serial emmc SD"

KERNEL_IMAGETYPE = ""
KERNEL_IMAGETYPES = "Image.gz Image"

SERIAL_CONSOLE = "115200 ttyS0"

MACHINE_EXTRA_RRECOMMENDS = " kernel-modules kernel-devicetree"
IMAGE_FSTYPES += "tar.bz2 wic wic.bmap"
WKS_FILE ?= "am62-sdimage.wks"
IMAGE_INSTALL:append = " kernel-devicetree kernel-image-image"
do_image_wic[depends] += " mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"

KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
KERNEL_DTBVENDORED = "1"

# multilib support
MULTILIBS ?= "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 ?= "armv7athf-neon"
PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
PREFERRED_VERSION_linux-yocto ?= "6.1%"
MACHINE_EXTRA_RRECOMMENDS += "linux-firmware-cnm"

NON_MULTILIB_RECIPES:append = " u-boot-ti-staging optee-os trusted-firmware-a ti-rtos-firmware ti-dm-fw ti-eth-fw ti-k3-secdev tisdk-uenv"


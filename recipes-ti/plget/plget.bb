HOMEPAGE = "https://github.com/ikhorn/plget"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
SRC_URI = "git://github.com/ikhorn/plget.git;protocol=https;branch=master"

SRCREV = "8bb19531936262d75a442c3d3651cfbcf722d856"
EXTRA_OEMAKE += " \               
       ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" \
"                                 
                                  
S = "${WORKDIR}/git"
COMPATIBLE_MACHINE = "ti-am62"

FILES:${PN} += "${bindir}/*"

do_install () {
	mkdir -p ${D}${bindir}
	install -c -m 755 ${WORKDIR}/git/plget ${D}${bindir}/
}

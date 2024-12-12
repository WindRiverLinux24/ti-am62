require ${@bb.utils.contains('MACHINE', 'ti-am62', 'linux-yocto-ti-am62.inc', '', d)}

KBRANCH:ti-am62 = "v6.6/standard/preempt-rt/ti-sdk-6.6/ti-soc"


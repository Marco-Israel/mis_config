qemu-system-arm -M virt -kernel linuximage  -append 'console=ttyS0,115200' -dtb am335x-mba335x.dtb -serial stdio -bios u-boot.bin  file=rootfs.ext2,if=sd,format=raw

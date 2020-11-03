#!/sbin/sh

mount /boot
mount /system_root

if [ -f /boot/ramdisk-boot.img ] && [ ! -f /boot/ramdisk-recovery.img ]; then
  mv /boot/ramdisk.img /boot/ramdisk-recovery.img
  mv /boot/ramdisk-boot.img /boot/ramdisk.img
  if [ ! -z $(cat /system_root/system/build.prop | grep ^ro.product.system.device=rpi3) ] && [ ! -z $(cat /system_root/system/build.prop | grep ^ro.hardware.gralloc=minigbm) ]; then
    sed -i 's/#dtoverlay=vc4-kms-v3d,cma-256/dtoverlay=vc4-kms-v3d,cma-256/' /boot/config.txt
    sed -i 's/#mask_gpu_interrupt0=0x400/mask_gpu_interrupt0=0x400/' /boot/config.txt
  fi
  if [ ! -z $(cat /system_root/system/build.prop | grep ^ro.product.system.device=rpi4) ] && [ ! -z $(cat /system_root/system/build.prop | grep ^ro.hardware.gralloc=gbm) ]; then
    sed -i 's/#dtoverlay=vc4-kms-v3d-pi4,noaudio/dtoverlay=vc4-kms-v3d-pi4,noaudio/' /boot/config.txt
  fi
fi

umount /boot
umount /system_root

exit 0

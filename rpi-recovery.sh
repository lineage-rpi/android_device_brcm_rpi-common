#!/sbin/sh

mount /boot
mount /system_root

if [ -f /boot/ramdisk-boot.img ] && [ ! -f /boot/ramdisk-recovery.img ]; then
  mv /boot/ramdisk.img /boot/ramdisk-recovery.img
  mv /boot/ramdisk-boot.img /boot/ramdisk.img
  if [ ! -z $(grep -Fx "ro.product.system.device=rpi3" /system_root/system/build.prop) ] && [ ! -z $(grep -Fx "ro.hardware.gralloc=minigbm" /system_root/system/build.prop) ]; then
    sed -i 's/#dtoverlay=vc4-kms-v3d/dtoverlay=vc4-kms-v3d/' /boot/config.txt
    sed -i 's/#mask_gpu_interrupt0=0x400/mask_gpu_interrupt0=0x400/' /boot/config.txt
  fi
  if [ ! -z $(grep -Fx "ro.product.system.device=rpi4" /system_root/system/build.prop) ] && [ ! -z $(grep -Fx "ro.hardware.gralloc=gbm" /system_root/system/build.prop) ]; then
    sed -i 's/#dtoverlay=vc4-kms-v3d/dtoverlay=vc4-kms-v3d/' /boot/config.txt
  fi
fi

umount /boot
umount /system_root

exit 0

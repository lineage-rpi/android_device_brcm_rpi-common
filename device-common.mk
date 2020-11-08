#
# Copyright (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PLATFORM_PATH := device/brcm/rpi-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, vendor/brcm/rpi-common/rpi-common-vendor.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/rpi-recovery.sh:recovery/root/sbin/rpi-recovery.sh \
    $(PLATFORM_PATH)/twrp.usb.fstab:recovery/root/etc/recovery.usb.fstab

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.system_root_image=true

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

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := true

TARGET_BOARD_PLATFORM := rpi

# Binder
TARGET_USES_64_BIT_BINDER := true

# Manifest
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml

# Partition sizes
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736 # 1536M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 134217728 # 128M
BOARD_VENDORIMAGE_PARTITION_SIZE := 268435456 # 256M
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_VENDORIMAGE := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_USE_EXT4 := true

# Properties
TARGET_SYSTEM_PROP += $(PLATFORM_PATH)/system.prop

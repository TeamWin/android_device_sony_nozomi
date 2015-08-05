# Copyright 2010 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# cpu
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a8
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
ARCH_ARM_HAVE_TLS_REGISTER := true

# compile flag
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DLEGACY_BLOB_COMPATIBLE -DQCOM_LEGACY_UIDS -DNEEDS_VECTORIMPL_SYMBOLS -DICS_CAMERA_BLOB

# display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/sony/nozomi/config/egl.cfg

TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYBASS := true
TARGET_USES_C2D_COMPOSITION := true

# audio
BOARD_USES_ALSA_AUDIO := true

# kernel
TARGET_PREBUILT_KERNEL := device/sony/nozomi/prebuilt/kernel

# board
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOOTLOADER_BOARD_NAME := fuji
TARGET_VENDOR_PLATFORM := fuji
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_TYPE := fastboot
BOARD_HAS_NO_MISC_PARTITION := true

# boot image
BOARD_KERNEL_ADDR	:= 0x40208000
BOARD_RAMDISK_ADDR	:= 0x41500000
BOARD_RPM_ADDR		:= 0x20000

# image
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/nozomi/config/fstab.recovery.semc
RECOVERY_FSTAB_VERSION := 2

# twrp
ifeq ($(TARGET_NO_RECOVERY),false)
TARGET_RECOVERY_TWRP := true

ifeq ($(TARGET_RECOVERY_TWRP),true)
TWRP_RECOVERY_FSTAB := device/sony/nozomi/config/fstab.twrp.semc
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
DEVICE_RESOLUTION := 720x1280
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/platform/msm_adc/msm_therm"
endif #TARGET_RECOVERY_TWRP
endif #TARGET_NO_RECOVERY

# custom boot
BOARD_CUSTOM_BOOTIMG_MK := device/sony/nozomi/custom/custombootimg.mk

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/sony/nozomi/sepolicy

BOARD_SEPOLICY_UNION += \
    recovery.te

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true



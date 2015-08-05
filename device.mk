#
# Copyright 2012 The Android Open Source Project
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

# Local variables (can be duplicate from BoardConfig.mk)
TARGET_RECOVERY_TWRP := true

# define build target(normal/native/loop)
BUILD_TARGET := normal

# define build fs
ifeq ($(BUILD_TARGET),loop)
BUILD_FS := loop
else
# (ext4,f2fs,dynamic)
BUILD_FS := dynamic
endif

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# kernel
PRODUCT_PACKAGES += \
    kernel

# Common Qualcomm / Sony scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/init.usbmode.sh:root/init.usbmode.sh \
    $(LOCAL_PATH)/config/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/config/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/config/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    $(LOCAL_PATH)/config/init.swap.sh:root/init.swap.sh \

# Custom init / uevent
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/init.semc.rc:root/init.semc.rc \
    $(LOCAL_PATH)/config/init.sony.rc:root/init.sony.rc \
    $(LOCAL_PATH)/config/ueventd.semc.rc:root/ueventd.semc.rc

# Normal/Native/Loop
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/fstab.$(BUILD_FS).semc:root/fstab.semc \
    $(LOCAL_PATH)/config/init.sony-platform.$(BUILD_TARGET).rc:root/init.sony-platform.rc

# Recovery: Custom init for twrp
ifeq ($(TARGET_RECOVERY_TWRP),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/init.recovery.semc.rc:root/init.recovery.semc.rc
endif

# Sony blob(s) necessary for nozomi hardware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/logo.rle:root/logo.rle

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# ADB access into recovery
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0

# Hw keys
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.hw.mainkeys=1 \

# Filesystem tools
PRODUCT_PACKAGES += \
    e2fsck \
    fsck_msdos \
    mkfs.f2fs

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

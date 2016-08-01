# Copyright (C) 2013 The CyanogenMod Project
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

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SerranoDSRIL

# Stock RIL files
PRODUCT_COPY_FILES += \
    device/samsung/serranodsdd/proprietary/bin/rild:system/bin/rild \
    device/samsung/serranodsdd/proprietary/lib/libril.so:system/lib/libril.so \
    device/samsung/serranodsdd/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/serranodsdd/proprietary/lib/libsec-ril-dsds.so:system/lib/libsec-ril-dsds.so

# Sound
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Inherit from serrano-common
$(call inherit-product, device/samsung/serrano-common/serrano-common.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/serranodsdd/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/serranodsdd/init.carrier.rc:root/init.carrier.rc \
    device/samsung/serranodsdd/init.class_main.sh:root/init.class_main.sh

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1

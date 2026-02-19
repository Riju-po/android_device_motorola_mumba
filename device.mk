#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/mumba
PRODUCT_SHIPPING_API_LEVEL := 36

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_TARGET_VNDK_VERSION := current

# Inherit base products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit vendor blobs
$(call inherit-product-if-exists, vendor/motorola/mumba/mumba-vendor.mk)

# Device identity
PRODUCT_DEVICE := mumba
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G57 Power
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/init.target.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.target.rc \
    $(LOCAL_PATH)/rootdir/etc/init.mmi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mmi.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc

# A/B OTA partitions
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    recovery \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor_boot \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    system_dlkm

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/resource-overlay/device

# Properties

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/system.prop:$(TARGET_COPY_OUT_SYSTEM)/system.prop \
    $(DEVICE_PATH)/product.prop:$(TARGET_COPY_OUT_PRODUCT)/product.prop \
    $(DEVICE_PATH)/system_ext.prop:$(TARGET_COPY_OUT_SYSTEM_EXT)/system_ext.prop \
    $(DEVICE_PATH)/vendor.prop:$(TARGET_COPY_OUT_VENDOR)/vendor.prop

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_config.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_parrot_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_parrot_qrd.xml \
    $(LOCAL_PATH)/configs/audio/resourcemanager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/resourcemanager.xml \
    $(LOCAL_PATH)/configs/audio/media_codecs_parrot_v0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_parrot_v0.xml
    
# Permissions
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/permissions/,$(TARGET_COPY_OUT_VENDOR)/etc/permissions)

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/sns_reg_config:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sns_reg_config \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/sensors/config/,$(TARGET_COPY_OUT_VENDOR)/etc/sensors/config)

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles_parrot_v0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_parrot_v0.xml

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal-engine-mumba.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-mumba.conf

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# VINTF
DEVICE_MANIFEST_FILE += $(LOCAL_PATH)/vintf/manifest.xml

# Explicitly copy the manifest... DELETED




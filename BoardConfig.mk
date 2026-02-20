#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# =====================================================
# Architecture
# =====================================================

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_SUPPORTS_64_BIT_APPS := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_VARIANT := generic


# =====================================================
# Paths
# =====================================================

DEVICE_PATH := device/motorola/mumba
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/vendor_ramdisk/etc/fstab.qcom


# =====================================================
# Platform
# =====================================================

TARGET_BOARD_PLATFORM := parrot
QCOM_BOARD_PLATFORMS += parrot
TARGET_BOOTLOADER_BOARD_NAME := mumba
BOARD_SHIPPING_API_LEVEL := 36
SHIPPING_API_LEVEL := 36
TARGET_SHIPPING_API_LEVEL := 36
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true


# =====================================================
# Boot Configuration
# =====================================================

BOARD_BOOT_HEADER_VERSION := 4
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version 4
BOARD_BUILD_INIT_BOOT_IMAGE := true
AB_OTA_UPDATER := true

BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_VENDOR_RAMDISK_USE_LZ4 := true
BOARD_USES_RECOVERY_AS_BOOT := false



# =====================================================
# Vendor Ramdisk (Kernel Modules)
# =====================================================

# Vendor Ramdisk
# =====================================================
# DELETED: BOARD_VENDOR_RAMDISK_FRAGMENTS code


# =====================================================
# Kernel (Prebuilt Bring-up Mode)
# =====================================================



BOARD_KERNEL_CMDLINE := console=ttyMSM0 loglevel=6 log_buf_len=256K androidboot.selinux=permissive
override BOARD_SEPOLICY_VERS := 202404

# Partition Sizes (100MB Boot/VendorBoot, 8MB InitBoot - Safe Defaults)
BOARD_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 134217728


TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/Image.gz-dtb



# =====================================================
# Dynamic Partitions
# =====================================================

BOARD_BUILD_SUPER_IMAGE := true
BOARD_SUPER_PARTITION_SIZE := 8589934592

BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    system_dlkm

# super - 4MB safety margin
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 8585740288

BOARD_USES_METADATA_PARTITION := true


# =====================================================
# Filesystem Types
# =====================================================

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_USES_SYSTEM_DLKMIMAGE := true

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/vintf/framework_compatibility_matrix.xml
BOARD_SEPOLICY_IGNORE_NEVERALLOWS := true
SELINUX_IGNORE_NEVERALLOWS := true
TARGET_SEPOLICY_IGNORE_NEVERALLOWS := true
BUILD_BROKEN_TREBLE_SYSPROP_NEVERALLOW := true



# =====================================================
# AVB (Android Verified Boot)
# =====================================================

# BOARD_AVB_ENABLE := true
# BOARD_AVB_MAKE_VBMETA_IMAGE := true
# BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
# BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
# BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
# BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# BOARD_AVB_VBMETA_SYSTEM := system system_ext product
# BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
# BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
# BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 1
# BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2


# =====================================================
# Filesystem Configuration
# =====================================================

TARGET_FS_CONFIG_GEN += device/motorola/mumba/config.fs

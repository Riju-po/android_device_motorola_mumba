#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# =====================================================
# Architecture (64-bit only — confirmed from firmware)
# =====================================================

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := kryo385


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
BOARD_SHIPPING_API_LEVEL := 202404
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# Vendor-specific AIDs (users/groups) for Qualcomm/Motorola init.rc files
TARGET_FS_CONFIG_GEN := device/motorola/mumba/config.fs


# =====================================================
# Boot Configuration
# =====================================================

BOARD_BOOT_HEADER_VERSION := 4
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version 4
BOARD_BUILD_INIT_BOOT_IMAGE := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_BUILD_VENDOR_RAMDISK_IMAGE := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
AB_OTA_UPDATER := true

BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_DTBOIMG_PARTITION_SIZE := 24117248

BOARD_VENDOR_RAMDISK_USE_LZ4 := true
BOARD_USES_RECOVERY_AS_BOOT := false


# =====================================================
# Kernel (Prebuilt Bring-up Mode)
# =====================================================

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/Image
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb

BOARD_KERNEL_CMDLINE := console=ttyMSM0 loglevel=6 log_buf_len=256K androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_USE_LZ4 := true


# =====================================================
# Partition Sizes (from stock firmware images)
# =====================================================

# boot = 98,304 KB = 96 MiB
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
# init_boot = 8,192 KB = 8 MiB
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
# vendor_boot = 98,304 KB = 96 MiB
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
# recovery = 1,31,072 KB = 128 MiB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728



# =====================================================
# Dynamic Partitions
# =====================================================

BOARD_BUILD_SUPER_IMAGE := true
# super = 83,88,608 KB = 8 GiB
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


# =====================================================
# VINTF
# =====================================================

DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/vintf/framework_compatibility_matrix.xml


# =====================================================
# SEPolicy
# =====================================================

BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
BOARD_SEPOLICY_IGNORE_NEVERALLOWS := true
BUILD_BROKEN_TREBLE_SYSPROP_NEVERALLOW := true


# =====================================================
# AVB (Android Verified Boot)
# =====================================================

BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2


# =====================================================
# Filesystem Configuration
# =====================================================

TARGET_FS_CONFIG_GEN += device/motorola/mumba/config.fs

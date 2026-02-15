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
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom


# =====================================================
# Platform
# =====================================================

TARGET_BOARD_PLATFORM := parrot
QCOM_BOARD_PLATFORMS += parrot
TARGET_BOOTLOADER_BOARD_NAME := mumba


# =====================================================
# Boot Configuration
# =====================================================

BOARD_BOOT_HEADER_VERSION := 4
BOARD_BUILD_INIT_BOOT_IMAGE := true
AB_OTA_UPDATER := true

BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_USES_RECOVERY_AS_BOOT := false


# =====================================================
# Kernel (Prebuilt Bring-up Mode)
# =====================================================

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096

BOARD_KERNEL_CMDLINE := console=ttyMSM0 loglevel=6 log_buf_len=256K androidboot.selinux=permissive

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
BOARD_USES_GENERIC_KERNEL_IMAGE := true


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

BOARD_SYSTEMIMAGE_PARTITION_TYPE := erofs
BOARD_VENDORIMAGE_PARTITION_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_USES_SYSTEM_DLKMIMAGE := true

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm

DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/vintf/manifest/manifest_mumba.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/vintf/compatibility_matrix.xml

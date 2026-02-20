LOCAL_PATH := $(call my-dir)

VRAMDISK_ETC_FILES := \
    etc/fstab.qcom \
    etc/init.mmi.rc \
    etc/init.qcom.rc \
    etc/init.target.rc \
    etc/ueventd.rc

$(foreach f, $(VRAMDISK_ETC_FILES), \
    $(eval include $(CLEAR_VARS)) \
    $(eval LOCAL_MODULE := mumba_vendor_ramdisk_$(notdir $(f))) \
    $(eval LOCAL_MODULE_CLASS := ETC) \
    $(eval LOCAL_MODULE_PATH := $(PRODUCT_OUT)/vendor_ramdisk/etc) \
    $(eval LOCAL_SRC_FILES := $(f)) \
    $(eval LOCAL_MODULE_STEM := $(notdir $(f))) \
    $(eval include $(BUILD_PREBUILT)) \
)

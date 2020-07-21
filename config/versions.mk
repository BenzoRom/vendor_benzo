# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=QQ3A.200705.002 BUILD_ID=QQ3A.200705.002 BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

ANDROID_NAME := tenzero

ROM_DATE := $(shell date -u +%Y%m%d)-$(shell date -u +%H%M)
ROM_VERSION := $(ROM_DATE)-$(TARGET_DEVICE)
BENZO_VERSION := $(ROM_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.benzo.version=$(ROM_VERSION)

# Clang version
CUSTOM_CLANG_VERSION := 12.0
CUSTOM_CLANG_SHORT_VERSION := 12.0.0

CUSTOM_CLANG_PATH := prebuilts/clang/host/linux-x86/$(CUSTOM_CLANG_VERSION)
CUSTOM_CLANG_VER := $(shell cat $(CUSTOM_CLANG_PATH)/VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.clang.version=$(CUSTOM_CLANG_VER)

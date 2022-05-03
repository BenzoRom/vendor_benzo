# Build ID
BUILDID := SP2A.220505.002

# Build prop overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILDID) \
    BUILD_ID=$(BUILDID) \
    BUILD_VERSION_TAGS=release-keys

# Android version
ANDROID_NAME := android12L

# Benzo versions
ROM_DATE := $(shell date -u +%Y%m%d)-$(shell date -u +%H%M)
ROM_VERSION := $(ROM_DATE)-$(BENZO_DEVICE)
BENZO_VERSION := $(ROM_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.benzo.version=$(ROM_VERSION)

# Clang version
CUSTOM_CLANG_VERSION := clang-benzo
CUSTOM_CLANG_SHORT_VERSION := 14.0.0

CUSTOM_CLANG_PATH := prebuilts/clang/host/linux-x86/$(CUSTOM_CLANG_VERSION)
CUSTOM_CLANG_VER := $(shell cat $(CUSTOM_CLANG_PATH)/VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.clang.version=$(CUSTOM_CLANG_VER)

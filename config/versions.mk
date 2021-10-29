# Build ID
BUILDID := SD1A.210817.015.A4

# Build prop overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILDID) \
    BUILD_ID=$(BUILDID) \
    BUILD_VERSION_TAGS=release-keys

# Android version
ANDROID_NAME := android11

# Benzo versions
ROM_DATE := $(shell date -u +%Y%m%d)-$(shell date -u +%H%M)
ROM_VERSION := $(ROM_DATE)-$(TARGET_DEVICE)
BENZO_VERSION := $(ROM_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.benzo.version=$(ROM_VERSION)

# Release name
PRODUCT_RELEASE_NAME := Pixel3XL
TARGET_DEVICE := crosshatch

# Inherit some common stuff.
$(call inherit-product, vendor/benzo/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/crosshatch/aosp_crosshatch.mk)

# Google Apps
$(call inherit-product, vendor/googleapps/googleapps.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := crosshatch
PRODUCT_NAME := benzo_crosshatch
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 3 XL
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=crosshatch \
    PRIVATE_BUILD_DESC="crosshatch-user 10 QQ1A.200205.002 6084386 release-keys"

BUILD_FINGERPRINT="google/crosshatch/crosshatch:10/QQ1A.200205.002/6084386:user/release-keys"
BUILD_THUMBPRINT="10/QQ1A.200205.002/6084386:user/release-keys"

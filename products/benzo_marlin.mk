# Release name
PRODUCT_RELEASE_NAME := PixelXL
export TARGET_DEVICE := marlin

# Inherit some common stuff.
$(call inherit-product, vendor/benzo/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/marlin/aosp_marlin.mk)

# Google Apps
$(call inherit-product, vendor/googleapps/googleapps.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := marlin
PRODUCT_NAME := benzo_marlin
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel XL
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    PRIVATE_BUILD_DESC="marlin-user 9 PQ2A.190205.003 5180536 release-keys"

BUILD_FINGERPRINT="google/marlin/marlin:9/PQ2A.190205.003/5180536:user/release-keys"
BUILD_THUMBPRINT="9/PQ2A.190205.003/5180536:user/release-keys"

# Copy device specific prebuilt files.
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/etc/apns-full-conf.xml:system/etc/apns-conf.xml \
    vendor/benzo/prebuilt/bootanimation.zip:system/media/bootanimation.zip

# Google VR
PRODUCT_PACKAGES += \
    libdvr_loader \
    com.google.vr.platform \
    com.google.vr.platform.xml

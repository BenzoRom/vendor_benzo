# Benzo Rom 
# 
# See config/optimizations/optimizations.mk to set build optimizations
# See config/common_versions.mk to set build numbers and OTA info

# Inherit build optimizations
include vendor/benzo/config/optimizations/optimizations.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay/common

# Extra packages
PRODUCT_PACKAGES += \
    Terminal

# Keyboard libs
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/lib64/libjni_latinimegoogle.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libjni_latinimegoogle.so

# ART changes
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD = false

# Inherit common product build prop overrides
-include vendor/benzo/config/common_versions.mk

# Inherit art options
$(call inherit-product, vendor/benzo/config/art.mk)
# Inherit common stuff
$(call inherit-product, vendor/benzo/config/common.mk)
# Inherit version information
$(call inherit-product, vendor/benzo/config/versions.mk)

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Stk

# Enable tethering
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.dun.override=0

# Benzo Rom 
#
# Inherit art options
$(call inherit-product, vendor/benzo/config/art.mk)
# Inherit version information
$(call inherit-product, vendor/benzo/config/versions.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay

PRODUCT_PACKAGES += \
    fonts_customization.xml

# Enable tethering
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.dun.override=0

# Use ccache
USE_CCACHE := false
ifeq ($(filter-out true,$(USE_CCACHE)),)
  CCACHE_EXEC := $(shell which ccache)
endif

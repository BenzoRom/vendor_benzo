# Benzo Rom 
#
PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay

# Extra packages
PRODUCT_PACKAGES += \
    ANGLEPrebuilt \
    libjni_latinimegoogle

# Props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Overlay packages
PRODUCT_PACKAGES += \
    PixelDocumentsUIGoogleOverlay

# Google fonts
PRODUCT_PACKAGES += \
    fonts_customization.xml \
    FontArbutusSourceOverlay \
    FontArvoLatoOverlay \
    FontRubikRubikOverlay \
    FontGoogleSansLatoOverlay \
    FontGoogleSansOverlay \
    FontNunitoSansOverlay

# Use ccache
USE_CCACHE := true
USE_SYSTEM_CCACHE := true
ifeq ($(filter-out true,$(USE_CCACHE)),)
  ifeq ($(filter-out true,$(USE_SYSTEM_CCACHE)),)
    CCACHE_EXEC := $(shell which ccache)
  else
    CCACHE_EXEC := prebuilts/build-tools/linux-x86/bin/ccache
  endif
endif

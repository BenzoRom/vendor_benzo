# Benzo Rom 
#
PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay

# Packages/Overlays
PRODUCT_PACKAGES += \
    BuiltInPrintServiceOverlay \
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
ifeq ($(filter-out true,$(USE_CCACHE)),)
  CCACHE_EXEC := $(shell which ccache)
endif

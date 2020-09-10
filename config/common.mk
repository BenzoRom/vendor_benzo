# Benzo Rom 
#
PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay

# Use ccache
USE_CCACHE := true
ifeq ($(filter-out true,$(USE_CCACHE)),)
  CCACHE_EXEC := $(shell which ccache)
endif

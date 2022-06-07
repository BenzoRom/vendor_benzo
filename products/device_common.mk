PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_ENFORCE_VINTF_MANIFEST := false
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true
PRODUCT_SET_DEBUGFS_RESTRICTIONS := false
USES_GOOGLE_DIALER_CARRIER_SETTINGS := true

PRODUCT_NAME := benzo_$(BENZO_DEVICE)
PRODUCT_SYSTEM_NAME := mainline
PRODUCT_MODEL := $(BENZO_MODEL)
PRODUCT_DEVICE := $(BENZO_DEVICE)
PRODUCT_BRAND := google
PRODUCT_SYSTEM_BRAND := google
PRODUCT_MANUFACTURER := Google
PRODUCT_SYSTEM_MANUFACTURER := Google

BUILD_NUMBER_OVERRIDE := $(shell echo $(BENZO_THUMBPRINT) | cut -d/ -f3 | cut -d: -f1)

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_BUILD_TYPE=user \
    TARGET_BUILD_FLAVOR=$(BENZO_DEVICE)-user \
    PRIVATE_BUILD_DESC=$(BENZO_BUILD_DESC) \
    BUILD_NUMBER=$(BUILD_NUMBER_OVERRIDE)

BUILD_FINGERPRINT := $(BENZO_FINGERPRINT)
BUILD_THUMBPRINT := $(BENZO_THUMBPRINT)

PLAT_PRIVATE_POLICY += vendor/benzo/sepolicy/private
PLAT_PUBLIC_POLICY += vendor/benzo/sepolicy/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += vendor/benzo/sepolicy/product/private
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/input

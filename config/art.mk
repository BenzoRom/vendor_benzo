# Don't build debug for host or device
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
ART_BUILD_TARGET_NDEBUG := true
ART_BUILD_TARGET_DEBUG := false
ART_BUILD_HOST_NDEBUG := true
ART_BUILD_HOST_DEBUG := false
USE_DEX2OAT_DEBUG := false

# Dexopt profiles
profile_path := vendor/dexopt_profiles
ifneq ($(wildcard $(profile_path)),)
PRODUCT_DEX_PREOPT_PROFILE_DIR := $(profile_path)
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed-profile
endif

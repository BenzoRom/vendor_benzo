# Benzo Rom 
#
PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay/common
# Inherit art options
include vendor/benzo/config/art.mk

# Extra packages
PRODUCT_PACKAGES += \
    bash \
    bashrc \
    Browser \
    OmniJaws \
    SubstratumSignature \
    Terminal \
    WeatherIcons

# Fonts packages
PRODUCT_PACKAGES += \
    invictrix-fonts

# Props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1 \
    ro.actionable_compatible_property.enabled=false \
    ro.com.android.prov_mobiledata=false \
    debug.performance.tuning=1 \
    keyguard.no_require_sim=true \
    persist.sys.strictmode.disable=true
#DL Audio
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    aaudio.dl_scheduler=true

# Copy hiddenapi whitelist
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/etc/sysconfig/benzo-hiddenapi-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/benzo-hiddenapi-whitelist.xml

# Copy all init rc files
$(foreach f,$(wildcard vendor/benzo/prebuilt/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Keyboard libs
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/lib64/libjni_latinimegoogle.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libjni_latinimegoogle.so

# Use ccache
export USE_CCACHE := true
# ThinLTO cache
export USE_THINLTO_CACHE := true

# SystemUITests
export EXCLUDE_SYSTEMUI_TESTS := true
# LLVM Tests
export SKIP_LLVM_TESTS := true
export ART_ANDROID_COMMON_TEST_MK := false

# Inherit common product build prop overrides
-include vendor/benzo/config/versions.mk

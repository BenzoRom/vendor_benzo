# Benzo Rom 
#
PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay
# Inherit art options
include vendor/benzo/config/art.mk

# Theme Picker
PRODUCT_PACKAGES += \
    ThemePicker

# Props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# LatinIME gesture lib
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/product/lib64/libjni_latinimegoogle.so:$(TARGET_COPY_OUT_PRODUCT)/lib64/libjni_latinimegoogle.so

# Google fonts
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/product/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \
    vendor/benzo/prebuilt/product/fonts/ArbutusSlab-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ArbutusSlab-Regular.ttf \
    vendor/benzo/prebuilt/product/fonts/GoogleSans-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-BoldItalic.ttf \
    vendor/benzo/prebuilt/product/fonts/GoogleSans-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Bold.ttf \
    vendor/benzo/prebuilt/product/fonts/GoogleSans-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Italic.ttf \
    vendor/benzo/prebuilt/product/fonts/GoogleSans-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-MediumItalic.ttf \
    vendor/benzo/prebuilt/product/fonts/GoogleSans-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Medium.ttf \
    vendor/benzo/prebuilt/product/fonts/GoogleSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Regular.ttf \
    vendor/benzo/prebuilt/product/fonts/Lato-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-BoldItalic.ttf \
    vendor/benzo/prebuilt/product/fonts/Lato-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Bold.ttf \
    vendor/benzo/prebuilt/product/fonts/Lato-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Italic.ttf \
    vendor/benzo/prebuilt/product/fonts/Lato-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-MediumItalic.ttf \
    vendor/benzo/prebuilt/product/fonts/Lato-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Medium.ttf \
    vendor/benzo/prebuilt/product/fonts/Lato-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Regular.ttf \
    vendor/benzo/prebuilt/product/fonts/Rubik-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-BoldItalic.ttf \
    vendor/benzo/prebuilt/product/fonts/Rubik-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Bold.ttf \
    vendor/benzo/prebuilt/product/fonts/Rubik-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Italic.ttf \
    vendor/benzo/prebuilt/product/fonts/Rubik-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-MediumItalic.ttf \
    vendor/benzo/prebuilt/product/fonts/Rubik-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Medium.ttf \
    vendor/benzo/prebuilt/product/fonts/Rubik-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Regular.ttf \
    vendor/benzo/prebuilt/product/fonts/ZillaSlab-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-MediumItalic.ttf \
    vendor/benzo/prebuilt/product/fonts/ZillaSlab-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-Medium.ttf \
    vendor/benzo/prebuilt/product/fonts/ZillaSlab-SemiBoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-SemiBoldItalic.ttf \
    vendor/benzo/prebuilt/product/fonts/ZillaSlab-SemiBold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-SemiBold.ttf

# Use ccache
USE_CCACHE := true

# Inherit common product build prop overrides
-include vendor/benzo/config/versions.mk

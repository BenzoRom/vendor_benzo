#
# Copyright (C) 2020 Benzo Rom
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Release name
PRODUCT_RELEASE_NAME := Pixel3XL
TARGET_DEVICE := crosshatch

# Inherit Benzo common setup.
$(call inherit-product, vendor/benzo/config/common_full_phone.mk)
# Inherit device tree configuration
$(call inherit-product, device/google/crosshatch/aosp_crosshatch.mk)
# Inherit Google App configuration
$(call inherit-product-if-exists, vendor/googleapps/googleapps.mk)

PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_NAME := benzo_crosshatch
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 3 XL
PRODUCT_MANUFACTURER := Google
PRODUCT_DEVICE := crosshatch

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=crosshatch \
    PRIVATE_BUILD_DESC="crosshatch-user 10 QQ2A.200305.002 6138846 release-keys"

BUILD_FINGERPRINT="google/crosshatch/crosshatch:10/QQ2A.200305.002/6138846:user/release-keys"
BUILD_THUMBPRINT="10/QQ2A.200305.002/6138846:user/release-keys"

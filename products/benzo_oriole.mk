#
# Copyright (C) 2021 Benzo Rom
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

TARGET_DEVICE := oriole

# Inherit Benzo common setup.
$(call inherit-product, vendor/benzo/config/common.mk)
# Inherit device tree configuration
$(call inherit-product, device/google/raviole/aosp_oriole.mk)
# Inherit Google App configuration
$(call inherit-product-if-exists, vendor/googleapps/googleapps.mk)

PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_ENFORCE_VINTF_MANIFEST := false

PRODUCT_NAME := benzo_oriole
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6
PRODUCT_MANUFACTURER := Google
PRODUCT_DEVICE := oriole

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=oriole \
    PRIVATE_BUILD_DESC="oriole-user 12 SD1A.210817.015.A4 7697517 release-keys"

BUILD_FINGERPRINT="google/oriole/oriole:12/SD1A.210817.015.A4/7697517:user/release-keys"
BUILD_THUMBPRINT="12/SD1A.210817.015.A4/7697517:user/release-keys"

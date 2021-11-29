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

BENZO_DEVICE := oriole
BENZO_MODEL := Pixel 6
BENZO_BUILD_DESC="oriole-user 12 SD1A.210817.037 7862242 release-keys"
BENZO_FINGERPRINT="google/oriole/oriole:12/SD1A.210817.037/7862242:user/release-keys"
BENZO_THUMBPRINT="12/SD1A.210817.037/7862242:user/release-keys"

# Inherit Benzo/aosp device/google app configurations
$(call inherit-product, vendor/benzo/config/common.mk)
$(call inherit-product, device/google/raviole/aosp_oriole.mk)
$(call inherit-product-if-exists, vendor/googleapps/googleapps.mk)

include vendor/benzo/products/device_common.mk

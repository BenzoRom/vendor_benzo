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

BENZO_DEVICE := bramble
BENZO_MODEL := Pixel 4a (5G)
BENZO_BUILD_DESC="bramble-user 12 RQ3A.210905.001 7671067 release-keys"
BENZO_FINGERPRINT="google/bramble/bramble:12/RQ3A.210905.001/7671067:user/release-keys"
BENZO_THUMBPRINT="12/RQ3A.210905.001/7671067:user/release-keys"

TARGET_DEVICE := $(BENZO_DEVICE)

# Inherit Benzo/aosp device/google app configurations
$(call inherit-product, vendor/benzo/config/common.mk)
$(call inherit-product, device/google/bramble/aosp_bramble.mk)
$(call inherit-product-if-exists, vendor/googleapps/googleapps.mk)

include vendor/benzo/products/device_common.mk

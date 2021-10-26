#!/bin/bash

# Get current path
current_path=$(eval pwd)

# Check for aapt
aapt_temp_path=$(eval which aapt)
if [ "$aapt_temp_path" == "" ]; then
  echo ""
  echo "ERROR: aapt not found. Please add the binary to your path."
  echo "ERROR: If you don't have the AndroidSDK, the binary can be found at"
  echo "ERROR: prebuilts/sdk/tools/linux/bin/aapt in and AOSP/Rom checkout."
  exit 0
fi
aapt_path=$aapt_temp_path

show_help() {
  echo 'Usage:'
  echo ''
  echo 'Search for apks recursively in current path and print permissions'
  echo "Example: ./`basename $0`"
  echo ''
  echo 'Search for apks recursively in specified path and print permissions'
  echo "Example: ./`basename $0` [path]"
}

print_header() {
  echo '<?xml version="1.0" encoding="utf-8"?>'
  echo '<!--'
  echo '     Copyright (C) 2021 Benzo Rom'
  echo ''
  echo '     Licensed under the Apache License, Version 2.0 (the "License");'
  echo '     you may not use this file except in compliance with the License.'
  echo '     You may obtain a copy of the License at'
  echo ''
  echo '          http://www.apache.org/licenses/LICENSE-2.0'
  echo ''
  echo '     Unless required by applicable law or agreed to in writing, software'
  echo '     distributed under the License is distributed on an "AS IS" BASIS,'
  echo '     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.'
  echo '     See the License for the specific language governing permissions and'
  echo '     limitations under the License.'
  echo '-->'
  echo '<permissions>'
  echo ''
}

print_footer() {
  echo '</permissions>'
}

get_apk_permissions() {
  # Get each permission and write
  apk_permissions=$(eval $aapt_path dump permissions $1 | grep uses-permission | sed -e "s/.*uses-permission-sdk-23: name='//" -e "s/' .*//" | sed -e "s/.*uses-permission: name='//" -e "s/' .*//" | sort| sed s/\'//g)
  for permission in $apk_permissions; do
    # Remove maxSdkVersion lines
    search_for_sdk_permissions=$(eval 'echo $permission | grep "maxSdkVersion"')
    if [[ -z "${search_for_sdk_permissions}" ]] ; then
      # Write permission line if not maxSdkVersion
      echo "        <permission name=\"$permission\"/>"
    fi
  done
}

get_permissions() {
  # Get list of apks in alphabetical order
  packages=$(eval 'find $1 -name '*.apk' -print | sort')
  for packageName in $packages; do
    # Get permissions from aapt
    app_package_name=$(eval $aapt_path dump badging $packageName | grep "package: name=" | sed -e "s/.*package: name='//" -e "s/' .*//")
    # Write app name and then permissions
    echo "    <privapp-permissions package=\"$app_package_name\">"
    get_apk_permissions $packageName
    echo "    </privapp-permissions>"
    echo ""
  done
}

if [ "$1" == "--help" ]; then
  show_help
elif [ "$1" == "-h" ]; then
  show_help
elif [ "$1" == "" ]; then
  print_header
  get_permissions $current_path
  print_footer
else
  print_header
  get_permissions $1
  print_footer
fi

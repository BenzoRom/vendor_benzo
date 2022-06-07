#!/bin/bash

# Permission strings to not include
permissions2ignore=(
  android.car.permission
  android.car.permission
  com.anddoes.launcher.permission
  com.htc.launcher.permission
  com.huawei.android.launcher.permission
  com.majeur.launcher.permission
  com.motorola.android.permission
  com.motorola.incallui.permission
  com.oppo.launcher.permission
  com.sec.android.app.myfiles.permission
  com.sec.android.gallery3d.provider2
  com.sec.android.provider.badge.permission
  com.sonyericsson.home.permission
  com.sonymobile.home.permission
  com.sonymobile.launcher.permission
  org.chromium.arc.apkcacheprovider.permission
)
# Don't print sdk permissions
permissions2ignore+=(maxSdkVersion)

#
# Start writing permissions
#

# Check if aapt2 is in PATH
aapt2=$(eval which aapt2)
if [ ${aapt2} == "" ]; then
  # If it's not, search for android-sdk build-tools and use that
  aapt2=${ANDROID_HOME}/build-tools/$(ls -1 --reverse ${ANDROID_HOME}/build-tools/ | head -1)/aapt2
  if [ ${aapt2} == "" ]; then
    echo ""
    echo "ERROR: aapt2 not found. Please add the binary to your path."
    echo "ERROR: If you don't have the AndroidSDK, the binary can be found at"
    echo "ERROR: prebuilts/sdk/tools/linux/bin/aapt2 in and AOSP/Rom checkout."
    exit 0
  fi
fi

show_help() {
  script_name=`basename $0`
  echo ${script_name}
  echo ''
  echo 'Search for apks recursively in current path and print permissions'
  echo "Example: ./${script_name}"
  echo ''
  echo 'Search for apks recursively in specified path or single apk and print permissions'
  echo "Example: ./${script_name} [path/apk]"
}

write_header() {
  echo '<?xml version="1.0" encoding="utf-8"?>'
  echo '<!--'
  echo '     Copyright (C) 2022 Benzo Rom'
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

write_footer() {
  echo '</permissions>'
}

search_ignored_permissions () { 
  local first arg
  first="$1"
  shift
  for arg in "$@"; do
      [[ ${first} == *"${arg}"* ]] && return
  done
  false
}

get_apk_permissions() {
  local -n perms=$2
  perms=$(eval ${aapt2} dump permissions $1 | grep uses-permission | sed -e "s/.*uses-permission-sdk-23: name='//" -e "s/' .*//" | sed -e "s/.*uses-permission: name='//" -e "s/' .*//" | sort| sed s/\'//g)
}

write_each_permission() {
  local apk_permissions

  # Get a list of all the permissions
  get_apk_permissions $1 apk_permissions

  for permission in ${apk_permissions}; do
      # Search for permissions to skip
      if search_ignored_permissions ${permission} ${permissions2ignore[@]}; then
        continue
      fi
      # Write permission line if not ignored
      echo "        <permission name=\"${permission}\"/>"
  done
}

write_apk_permissions() {
  # Get a sorted list of apks
  packages=$(eval 'find $1 -name '*.apk' -print | sort')

  for package_name in ${packages}; do
    # Check if apk has any permissions and skip it if it doesn't.
    [[ $(eval ${aapt2} dump permissions ${package_name} | grep uses-permission:) == "" ]] && continue

    # Write app name and permissions
    echo "    <privapp-permissions package=\"$(eval ${aapt2} dump packagename ${package_name})\">"
    write_each_permission ${package_name}
    echo "    </privapp-permissions>"
    echo ""
  done
}

if [ "$1" == "--help" ]; then
  show_help
elif [ "$1" == "-h" ]; then
  show_help
elif [ "$1" == "" ]; then
  write_header
  write_apk_permissions $(eval pwd)
  write_footer
else
  write_header
  write_apk_permissions $1
  write_footer
fi

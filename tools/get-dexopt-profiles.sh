#!/bin/bash

# Packages to get profiles for
packages="
com.chrome.beta
com.android.vending
com.google.android.apps.messaging
com.google.android.apps.nexuslauncher
com.google.android.apps.turbo
com.google.android.calculator
com.google.android.calendar
com.google.android.contacts
com.google.android.deskclock
com.google.android.dialer
com.google.android.gm
com.google.android.gms
com.google.android.googlequicksearchbox
com.google.android.GoogleCamera
com.google.android.settings.intelligence
"

# Get the profiles
for packageName in $packages; do
    # Get current profile for package
    adb shell cmd package snapshot-profile $packageName
    # Pull that profile
    adb pull /data/misc/profman/$packageName.prof
done

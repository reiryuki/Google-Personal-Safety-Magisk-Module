# Google Personal Safety Magisk Module

## DISCLAIMER
- Google apps are owned by Google LLC
- The MIT license specified here is for the Magisk Module only, not for Google apps.

## Descriptions
Emergency and safety app by Google LLC integrated as a Magisk Module for all supported and rooted devices with Magisk

## Sources
https://apkmirror.com com.google.android.apps.safetyhub by Google LLC

## Changelog

v0.6
- Prepare /storage/emulated/"$USR"/Android/data/$PKG/ directories
- Resets module folders/files permissions at post-fs-data
- Move _uninstall.log to /data/adb/logs/

v0.5
- Set install-in-user-type config

v0.4
- Update apk version in minimum SDK 31 variants
- Add initial-package-state sysconfig
- Abort installation if fail to mount mirror system

v0.3
- Update apk version for arm64-v8a variant
- Add Action button to clear app caches
- Fix bug in uninstall.sh

v0.2
- Android Emulator support

v0.1
- Initial release

## Screenshots
https://t.me/ryukinotes/26

## Requirements
- GApps installed
- Magisk or Kitsune Mask or KernelSU or Apatch installed

## Installation Guide & Download Link
- If you are using KernelSU, you need to disable Unmount Modules by Default in KernelSU app settings and install https://github.com/KernelSU-Modules-Repo/meta-overlayfs or https://github.com/KernelSU-Modules-Repo/magic_mount_rs or https://github.com/KernelSU-Modules-Repo/hybrid_mount or https://github.com/maxsteeel/nomount first depending on ROM compatibility
- Download the right module according to your device architecture and Android version:
  - arm64-v8a Minimum SDK 31: https://bicolink.com/8QQ
  - arm64-v8a (LPR version) Minimum SDK 29: https://bicolink.com/3WiWTGdZya
  - Universal (GMS version) Minimum SDK 31: https://bicolink.com/OBe
- Install the module via Magisk app or Kitsune Mask app or KernelSU app or Apatch app or Recovery if Magisk or Kitsune Mask installed
- Reboot
- If you are using KernelSU, you need to allow superuser list manually all package name listed in package.txt (and your home launcher app also) (enable show system apps) and reboot afterwards
- Open Termux app or any Terminal Emulator app and run this to see your default Emergency App:

`su -c cmd role get-role-holders android.app.role.EMERGENCY`

- If the output is not com.google.android.apps.safetyhub like com.android.emergency or anything else, then you need to set com.google.android.apps.safetyhub as your default Emergency App:
  
`su -c cmd role add-role-holder android.app.role.EMERGENCY com.google.android.apps.safetyhub`

- If you want to restore your default Emergency App, for example if it's com.android.emergency, then:
  
`su -c cmd role add-role-holder android.app.role.EMERGENCY com.android.emergency`


## Download Tutorial
https://t.me/ryukinotes/97

## Optionals
Global: https://t.me/ryukinotes/35

## Troubleshootings
Global: https://t.me/ryukinotes/34

## Support & Bug Report
- https://t.me/ryukinotes/54
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- @HuskyDG
- https://t.me/androidryukimodsdiscussions
- https://t.me/androidappsportdevelopment

## Sponsors
https://t.me/ryukinotes/25



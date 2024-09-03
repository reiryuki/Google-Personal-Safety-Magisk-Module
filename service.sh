MODPATH=${0%/*}

# log
exec 2>$MODPATH/debug.log
set -x

# var
API=`getprop ro.build.version.sdk`

# wait
until [ "`getprop sys.boot_completed`" == 1 ]; do
  sleep 10
done

# list
PKGS="`cat $MODPATH/package.txt`
      com.google.android.apps.safetyhub:primes_lifeboat"
for PKG in $PKGS; do
  magisk --denylist rm $PKG 2>/dev/null
  magisk --sulist add $PKG 2>/dev/null
done
if magisk magiskhide sulist; then
  for PKG in $PKGS; do
    magisk magiskhide add $PKG
  done
else
  for PKG in $PKGS; do
    magisk magiskhide rm $PKG
  done
fi

# grant
PKG=com.google.android.apps.safetyhub
if appops get $PKG > /dev/null 2>&1; then
  pm grant $PKG android.permission.ACCESS_FINE_LOCATION
  pm grant $PKG android.permission.ACCESS_COARSE_LOCATION
  pm grant $PKG android.permission.ACCESS_BACKGROUND_LOCATION
  pm grant $PKG android.permission.ANSWER_PHONE_CALLS
  pm grant $PKG android.permission.READ_PHONE_STATE
  pm grant $PKG android.permission.CALL_PHONE
  pm grant $PKG android.permission.READ_CONTACTS
  pm grant $PKG android.permission.WRITE_CONTACTS
  pm grant $PKG android.permission.CAMERA
  pm grant $PKG android.permission.ACTIVITY_RECOGNITION
  pm grant $PKG android.permission.RECORD_AUDIO
  appops set $PKG SYSTEM_ALERT_WINDOW allow
  if [ "$API" -ge 33 ]; then
    pm grant $PKG android.permission.POST_NOTIFICATIONS
    appops set $PKG ACCESS_RESTRICTED_SETTINGS allow
  fi
  APP=SafetyHubSuwPrebuilt
  NAME=android.permission.ACCESS_BACKGROUND_LOCATION
  if ! dumpsys package $PKG | grep "$NAME: granted=true"; then
    FILE=`find $MODPATH/system -type f -name $APP.apk`
    pm install -g -i com.android.vending $FILE
    pm uninstall -k $PKG
  fi
  PKGOPS=`appops get $PKG`
  UID=`dumpsys package $PKG 2>/dev/null | grep -m 1 Id= | sed -e 's|    userId=||g' -e 's|    appId=||g'`
  if [ "$UID" ] && [ "$UID" -gt 9999 ]; then
    UIDOPS=`appops get --uid "$UID"`
  fi
fi







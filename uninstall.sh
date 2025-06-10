mount -o rw,remount /data
[ ! "$MODPATH" ] && MODPATH=${0%/*}
[ ! "$MODID" ] && MODID=`basename "$MODPATH"`
UID=`id -u`
[ ! "$UID" ] && UID=0

# log
exec 2>/data/adb/$MODID\_uninstall.log
set -x

# run
. $MODPATH/function.sh

# cleaning
remove_cache
remove_sepolicy_rule

# restore
#RFILE=`find /data/system /data/misc* -type f -name roles.xml`
#Rchmod 0600 $FILE
#Rsed -i 's|com.google.android.apps.safetyhub|com.android.emergency|g' $FILE



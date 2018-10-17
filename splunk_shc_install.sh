# Drop SH base apps

CONFIG_SPLK_PATH=/tmp/splunk-pkgs/config_base
SPLUNK_HOME=/opt/splunk
APPS=$SPLUNK_HOME/etc/apps

cp -r $CONFIG_SPLK_PATH/hawkEye_shc_base $APPS/
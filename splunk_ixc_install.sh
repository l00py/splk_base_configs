# Drop IX base apps

CONFIG_SPLK_PATH=/tmp/splunk-pkgs/config_base
SPLUNK_HOME=/opt/splunk
APPS=$SPLUNK_HOME/etc/apps

cp -r $CONFIG_SPLK_PATH/hawkEye_cluster_idx_base $APPS/
#cp -r $CONFIG_SPLK_PATH/hawkEye_cluster_site29_idx_base $APPS/
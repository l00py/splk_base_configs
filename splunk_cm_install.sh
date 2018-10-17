# Drop CM base apps

CONFIG_SPLK_PATH=/tmp/splunk-pkgs/config_base
SPLUNK_HOME=/opt/splunk
APPS=$SPLUNK_HOME/etc/apps
MASTER_APPS=$SPLUNK_HOME/etc/master-apps

# CM Base configs
cp -r $CONFIG_SPLK_PATH/hawkEye_cluster_cm_base $APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_all_license $APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_all_outputs $APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_auth_ldap $APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_auth_role_admin $APPS/
cp -r $CONFIG_SPLK_PATH/TA-hawkEye_splunk $APPS/

# IXC Base apps to push
#cp -r $CONFIG_SPLK_PATH/hawkEye_cluster_idx_base $MASTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_all_indexes $MASTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_all_license $MASTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_auth_ldap $MASTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_auth_role_admin $MASTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_idx_base $MASTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_idx_volume_indexes $MASTER_APPS/

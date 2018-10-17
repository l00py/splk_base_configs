# Drop Utility base apps

CONFIG_SPLK_PATH=/tmp/splunk-pkgs/config_base
SPLUNK_HOME=/opt/splunk
APPS=$SPLUNK_HOME/etc/apps
SHCLUSTER_APPS=$SPLUNK_HOME/etc/shcluster/apps
DS_APPS=$SPLUNK_HOME/etc/deployment-client

# Base configs for server
cp -r $CONFIG_SPLK_PATH/hawkEye_all_license $APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_all_outputs $APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_auth_ldap $APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_auth_role_admin $APPS/
cp -r $CONFIG_SPLK_PATH/TA-hawkEye_splunk $APPS/

# SHC Deployer
cp -r $CONFIG_SPLK_PATH/hawkEye_all_indexes $SHCLUSTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_all_license $SHCLUSTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_all_outputs $SHCLUSTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_auth_ldap $SHCLUSTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_auth_role_admin $SHCLUSTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_auth_role_others $SHCLUSTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_sh_volume_indexes $SHCLUSTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_shc_base $SHCLUSTER_APPS/
cp -r $CONFIG_SPLK_PATH/TA-hawkEye_splunk $SHCLUSTER_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_cluster_sh_base $SHCLUSTER_APPS/

# Deployment-Client
cp -r $CONFIG_SPLK_PATH/TA-hawkEye_splunk $DS_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_uf_deploymentclient $DS_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_syslog_inputs $DS_APPS/
cp -r $CONFIG_SPLK_PATH/hawkEye_windows_inputs $DS_APPS/

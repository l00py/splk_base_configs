# Disable THP and set Tuned profile
mkdir /etc/tuned/splunk-nothp
cp /tmp/splunk-pkgs/Ulimits_THP/tuned.conf /etc/tuned/splunk-nothp
tuned-adm profile splunk-nothp

# Set systemd Splunk service
cp /tmp/splunk-pkgs/Ulimits_THP/splunk.service /etc/systemd/system/
chmod 664 /etc/systemd/system/splunk.service

# Untar Splunk
tar -zxf /tmp/splunk-pkgs/splunk-7.1.3-51d9cac7b837-Linux-x86_64.tgz -C /opt
cp /tmp/splunk-pkgs/user-seed.conf /opt/splunk/etc/system/local/
chown -R root. /opt/splunk

# Implement base config apps drop

# Start Splunk
#service splunk start
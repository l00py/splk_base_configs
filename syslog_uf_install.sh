# Create temp dir
mkdir /tmp/splunk-pkgs && cd /tmp/splunk-pkgs

# Download all the pkgs
wget --no-check-certificate -O master.zip 'https://github.com/l00py/splk_base_configs/archive/master.zip'
wget --no-check-certificate -O epel-release-latest-7.noarch.rpm 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
wget --no-check-certificate -O splunk-7.1.3-51d9cac7b837-Linux-x86_64.tgz 'https://www.splunk.com/page/download_track?file=7.1.3/linux/splunk-7.1.3-51d9cac7b837-Linux-x86_64.tgz&ac=google_amer_usa_en_remarketing&wget=true&name=wget&platform=Linux&architecture=x86_64&version=7.1.3&product=splunk&typed=release'
wget --no-check-certificate -O splunkforwarder-7.2.0-8c86330ac18-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.0&product=universalforwarder&filename=splunkforwarder-7.2.0-8c86330ac18-Linux-x86_64.tgz&wget=true'

# Unzip/Untar the pkgs
unzip master.zip
tar -zxf configs.tgz

# Disable THP and set Tuned profile
mkdir /etc/tuned/splunk-nothp
cp /tmp/splunk-pkgs/Ulimits_THP/tuned.conf /etc/tuned/splunk-nothp
tuned-adm profile splunk-nothp

# Set systemd Splunk service
cp /tmp/splunk-pkgs/Ulimits_THP/splunk-uf.service /etc/systemd/system/
chmod 664 /etc/systemd/system/splunk-uf.service

# Disable Rsyslog
service rsyslog stop
chkconfig rsyslog off

# Set Kernel buffer
sysctl -w net.core.rmem_max=1073741824
sysctl -w net.ipv4.udp_rmem_min=16384
sysctl -w net.ipv4.tcp_rmem='32768 2097152 134217728'

# Install Syslog-Ng
yum -y install /tmp/splunk-pkgs/epel-release-latest-7.noarch.rpm
yum -y install syslog-ng
cp /tmp/splunk-pkgs/syslog-ng_splk.conf /etc/syslog-ng/conf.d
service syslog-ng start

# Untar Splunk
tar -zxf /tmp/splunk-pkgs/splunkforwarder-7.2.0-8c86330ac18-Linux-x86_64.tgz -C /opt
chown -R root. /opt/splunkforwarder

# Start Splunk
service splunk-uf start
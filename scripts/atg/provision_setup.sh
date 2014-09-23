# this script runs once on provision
# at the end of it, you've got a database ready for connections from ATG

# verify centos release
cat /etc/centos-release

# convert into Oracle Linux 6
curl -O https://linux.oracle.com/switch/centos2ol.sh
sh centos2ol.sh; echo success

# verify oracle release
cat /etc/oracle-release

# upgrade yum
yum upgrade -y

# install some tools and libraries that are required
yum install -y unzip ant ant-nodeps ant-contrib libaio telnet

# set environment variables
echo "export JAVA_HOME=/usr/java/jdk1.7.0_67" >> /home/vagrant/.bash_profile \
 && echo "export DYNAMO_HOME=/home/vagrant/ATG/ATG11.1/home" >> /home/vagrant/.bash_profile \
 && echo "export JBOSS_HOME=/home/vagrant/jboss" >> /home/vagrant/.bash_profile \
 && echo "export ATG_HOME=/home/vagrant/ATG/ATG11.1/home" >> /home/vagrant/.bash_profile \
 && echo "export ATG_DIR=/root/ATG/ATG11.1" >> /home/vagrant/.bash_profile \
 && echo "export JAVA_VM=/usr/java/jdk1.7.0_67/bin/java" >> /home/vagrant/.bash_profile \
 && echo "export JAVA_ARGS=-Duser.timezone=UTC" >> /home/vagrant/.bash_profile \
 && echo "export JAVA_OPTS=-Duser.timezone=UTC -server -Xms512m -Xmx1024m -XX:MaxPermSize=256m -XX:MaxNewSize=256m -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000" >> /home/vagrant/.bash_profile \
 && echo "source /usr/local/endeca/MDEX/6.5.1/mdex_setup_sh.ini" >> /home/vagrant/.bash_profile \
 && echo "source /usr/local/endeca/PlatformServices/workspace/setup/installer_sh.ini" >> /home/vagrant/.bash_profile \
 && echo "export ENDECA_TOOLS_ROOT=/usr/local/endeca/ToolsAndFrameworks/11.1.0" >> /home/vagrant/.bash_profile \
 && echo "export ENDECA_TOOLS_CONF=/usr/local/endeca/ToolsAndFrameworks/11.1.0/server/workspace" >> /home/vagrant/.bash_profile \
 && echo "export PATH=/usr/java/jdk1.7.0_67/bin:$PATH" >> /home/vagrant/.bash_profile

# jdk
rpm -Uvh /vagrant/software/jdk-7u67-linux-x64.rpm

# directories
mkdir /usr/local/endeca
chmod 755 /usr/local/endeca
chown vagrant:vagrant /usr/local/endeca

echo "setup done"
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

# install tools
yum install -y unzip

# TODO: is this necessary?
#
# fix locale error
yum reinstall -y glibc-common
echo LANG=en_US.utf-8 >> /etc/environment \
 && echo LC_ALL=en_US.utf-8 >> /etc/environment

# install the 11g prereqs
yum install -y oracle-rdbms-server-11gR2-preinstall

# create directories
mkdir /opt/oracle /opt/oraInventory /opt/datafile \
 && chown oracle:oinstall -R /opt

# set environment variables
echo "export ORACLE_BASE=/opt/oracle" >> /home/oracle/.bash_profile \
 && echo "export ORACLE_HOME=/opt/oracle/product/11.2.0/dbhome_1" >> /home/oracle/.bash_profile \
 && echo "export ORACLE_SID=orcl" >> /home/oracle/.bash_profile \
 && echo "export PATH=\$PATH:\$ORACLE_HOME/bin" >> /home/oracle/.bash_profile



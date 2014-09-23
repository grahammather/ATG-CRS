echo "setting up dbora service"
cp /vagrant/scripts/db/dbora /etc/init.d/dbora
chmod 750 /etc/init.d/dbora
chkconfig --add dbora
mkdir -p /home/oracle/scripts
chown oracle.oinstall /home/oracle/scripts
cp /vagrant/scripts/db/startup.sh /home/oracle/scripts
cp /vagrant/scripts/db/shutdown.sh /home/oracle/scripts
chmod u+x /home/oracle/scripts/startup.sh /home/oracle/scripts/shutdown.sh
chown oracle.oinstall /home/oracle/scripts/startup.sh /home/oracle/scripts/shutdown.sh
service dbora stop
service dbora start
echo "dbora service setup complete"
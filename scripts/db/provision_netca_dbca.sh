exec sudo -u oracle /bin/sh - << eof
	
	# make sure we've got the right environment variables
	source /home/oracle/.bash_profile

	netca -silent -responseFile /opt/oracle/product/11.2.0/dbhome_1/assistants/netca/netca.rsp

	dbca -silent -createDatabase -responseFile /vagrant/scripts/db/dbca.rsp

eof
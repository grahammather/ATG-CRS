# move the data dump to the builtin data_pump_dir
cp /vagrant/scripts/db/atg.dmp /opt/oracle/admin/orcl/dpdump/atg.dmp
chown oracle:oinstall /opt/oracle/admin/orcl/dpdump/atg.dmp

# do this as oracle
exec sudo -u oracle /bin/sh - << eof
	# get the env
	source /home/oracle/.bash_profile

	# run the import
	impdp system/oracle@orcl schemas=atg_pub,atg_prod,atg_cata,atg_catb directory=data_pump_dir dumpfile=atg.dmp logfile=atgdmp.log

eof
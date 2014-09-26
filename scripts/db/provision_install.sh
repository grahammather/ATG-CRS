unzip -n /vagrant/software/p13390677_112040_Linux-x86-64_1of7.zip -d /vagrant/software
unzip -n /vagrant/software/p13390677_112040_Linux-x86-64_2of7.zip -d /vagrant/software

# run this part as oracle
exec sudo -u oracle /bin/sh - << eof
	/vagrant/software/database/runInstaller -waitforcompletion -silent -ignorePrereq -responseFile /vagrant/scripts/db/db_install.rsp 
eof
# endeca

# MDEX
/vagrant/software/OCmdex6.5.1-Linux64_829811.sh --silent --target /usr/local
source /usr/local/endeca/MDEX/6.5.1/mdex_setup_sh.ini

# platform services
/vagrant/software/OCplatformservices11.1.0-Linux64.bin --silent --target /usr/local/ < /vagrant/scripts/atg/endeca_platformservices_silent.txt 
source /usr/local/endeca/PlatformServices/workspace/setup/installer_sh.ini

# tools and frameworks
export ENDECA_TOOLS_ROOT=/usr/local/endeca/ToolsAndFrameworks/11.1.0
export ENDECA_TOOLS_CONF=/usr/local/endeca/ToolsAndFrameworks/11.1.0/server/workspace

/vagrant/software/cd/Disk1/install/silent_install.sh /vagrant/scripts/atg/endeca_toolsandframeworks_silent_response.rsp ToolsAndFrameworks /usr/local/endeca/ToolsAndFrameworks admin

sudo /home/vagrant/oraInventory/orainstRoot.sh

# CAS
/vagrant/software/OCcas11.1.0-Linux64.sh --silent --target /usr/local < /vagrant/scripts/atg/endeca_cas_silent.txt




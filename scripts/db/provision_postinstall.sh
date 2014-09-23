# verify that we're running as root

echo running postinstall actions as `whoami`

# oracle postinstall actions
/opt/oraInventory/orainstRoot.sh
/opt/oracle/product/11.2.0/dbhome_1/root.sh
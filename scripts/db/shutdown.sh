#!/bin/bash

export TMP=/tmp
export TMPDIR=$TMP
export PATH=/usr/sbin:/usr/local/bin:$PATH
export ORACLE_HOSTNAME=db11g
export ORACLE_UNQNAME=orcl

export ORACLE_SID=orcl 
ORAENV_ASK=NO
. oraenv
ORAENV_ASK=YES

# Stop Database
sqlplus / as sysdba << EOF
SHUTDOWN IMMEDIATE;
EXIT;
EOF

# Stop Listener
lsnrctl stop
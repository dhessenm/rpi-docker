#!/bin/bash

# first install
if [[ ! -f /home/ghost/installed ]]; then
   # check if mysql is present
   until mysqladmin ping -u root -p12345678 -h 192.168.1.22
   do
      echo "Waiting for database connection..."
      sleep 5
   done

   echo "Create DB User ghost ..."
   mysql -u root -p12345678 -h 192.168.1.21  < create_db_user.sql

   echo "Create DB schema ghost ..."
   mysql -u ghost -pghost -h 192.168.1.21 ghost < ghost.sql

   # configure ghost
   echo "Copy config file"

   touch /home/ghost/installed
fi

# configure ghost
# cp config file ...
echo "configure ..."

# run ghost
echo "run ghost ..."







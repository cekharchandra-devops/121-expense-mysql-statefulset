#!/bin/bash
set -e

MYSQL_ROOT_PASSWORD=ExpenseApp@1
# Start MySQL service in the background
docker-entrypoint.sh mysqld &

# Wait for MySQL to be ready
until mysqladmin ping -h 127.0.0.1 --silent; do
    echo "Waiting for MySQL to be ready..."
    sleep 2
done

# Connect to MySQL and start Group Replication
mysql -u root -p$MYSQL_ROOT_PASSWORD <<EOF
CHANGE MASTER TO MASTER_USER='replication' FOR CHANNEL 'group_replication_recovery';
START GROUP_REPLICATION;
EOF

# Bring MySQL process to foreground
wait

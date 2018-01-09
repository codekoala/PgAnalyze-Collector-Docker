#!/bin/bash 

cat << EOF > /etc/pganalyze-collector.conf
[pganalyze]
api_key: $PG_ANALYZE_KEY

[server1]
db_name: $DB_NAME
db_username: $DB_USER
db_password: $DB_PASS
db_host: $DB_HOST
db_port: $DB_PORT
aws_db_instance_id: $DB_INSTANCE
aws_region: $DB_REGION

#[server2]
#db_name: mydb, *
#db_username: myusername
#db_password: mypassword
#db_host: 127.0.0.1
#db_port: 5432
#aws_db_instance_id: your_rds_instance
#aws_region: us-west-2
EOF

set -e
pganalyze-collector --test
echo "[pganalyze-container] Test was successful; starting"
pganalyze-collector

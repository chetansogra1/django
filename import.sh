#!/bin/bash
set -e

DB_NAME="docker_lab"
DB_USER="postgres"
DB_USER_PASS="tech"

createdb "$DB_NAME"

psql <<EOF
CREATE USER $DB_USER WITH PASSWORD '$DB_USER_PASS';
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOF

echo "Postgres User '$DB_USER' and database '$DB_NAME' created."

docker exec -i postgres_db psql -U postgres -d docker_lab < docker_lab.sql


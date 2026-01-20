#!/bin/bash
set -e

DB_NAME="docker_lab"
DB_USER="postgres"
DB_USER_PASS="tech"
CONTAINER_NAME="postgres_db"

# Create database
docker exec -i $CONTAINER_NAME createdb -U postgres $DB_NAME || true

# Create user
docker exec -i $CONTAINER_NAME psql -U postgres <<EOF
DO
\$do\$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles WHERE rolname = '$DB_USER'
   ) THEN
      CREATE USER $DB_USER WITH PASSWORD '$DB_USER_PASS';
   END IF;
END
\$do\$;
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOF

# Import SQL file
docker exec -i $CONTAINER_NAME psql -U postgres -d $DB_NAME < docker_lab.sql

echo "✅ Database import completed successfully"


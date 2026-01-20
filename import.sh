#!/bin/bash

set -e
DB_NAME=${postgres}
DB_USER=${django_lab}
DB_USER_PASS=${tech}
#<<EOF createdb  $DB_NAME;
#psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_USER_PASS';"
#psql -c "grant all privileges on database $DB_NAME to $DB_USER;"
#echo "Postgres User '$DB_USER' and database '$DB_NAME' created."
#EOF
cat docker_lab.sql | docker exec -i postgres_db psql -U postgres -d postgres

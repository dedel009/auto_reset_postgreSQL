#!/bin/bash
set -e

echo "Running pg_restore"

# SQL 스크립트 실행
pg_restore -U "$POSTGRES_USER" -v -d "$POSTGRES_DB" /docker-entrypoint-initdb.d/restore.sql

pg_restore -U "$POSTGRES_USER" -v -d "$POSTGRES_DB" /docker-entrypoint-initdb.d/separate_table_ddl.sql


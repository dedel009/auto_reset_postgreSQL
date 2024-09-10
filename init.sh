#!/bin/bash
set -e

echo "Custom restore shell scripts"

# SQL 스크립트 실행
# pg_restore -U "$POSTGRES_USER" -v -d "$POSTGRES_DB" /docker-entrypoint-initdb.d/restore.sql


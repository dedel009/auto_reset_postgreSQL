#!/bin/bash
set -e

# PostgreSQL 서버가 시작될 때까지 대기
until pg_isready -h localhost; do
  sleep 1
done

# SQL 스크립트 실행
# psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/restore.sql
# 스키마만 복원
pg_restore -U ronfic --schema-only -v -d ronfic_main /docker-entrypoint-initdb.d/restore.sql
# 데이터만 복원
pg_restore -U ronfic --data-only -j 8 -v -d ronfic_main /docker-entrypoint-initdb.d/restore.sql
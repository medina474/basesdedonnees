#!/bin/bash

set -a
source .env
set +a

psql -h 127.0.0.1 -p 5432 -U iut -d cinema -f ./backup.sql

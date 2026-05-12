\pset tuples_only on

drop database if exists gravity with (force);

-- Crée une nouvelle base nommée gravity.
create database gravity owner gravity;

\c gravity;
set role gravity;

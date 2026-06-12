drop database if exists ventdest with (force);

-- Crée une nouvelle base nommée Vent d'Est.
create database ventdest owner ventdest;

\c ventdest;

set role ventdest;

\c postgres;

revoke all on schema public from PUBLIC;

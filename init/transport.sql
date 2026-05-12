\pset tuples_only on

drop database if exists transport with (force);

create database transport owner transport;

\c transport;
set role transport;

create table vehicule (
  immatriculation text primary key,
  marque text
);

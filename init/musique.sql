\pset tuples_only on

drop database if exists musique with (force);

create database musique owner musique;

\c musique;

-- --------

create table artist
(
  id uuid primary key default uuidv7(),
  name text not null,
  logo text
);

create temporary table artist_temp
(
  num int,
  name text,
  logo text,
  id uuid
);

copy artist_temp
from '/tmp/musique/artist.csv' (format csv, header, encoding 'UTF8');

insert into artist (id, name)
select id, name from artist_temp;

-- --------

create table person
(
  id uuid primary key default uuidv7(),
  lastname text not null,
  firstname text ,
  dob date not null,
  dod date,
  nationalities character(2)[] ,
  artistname text
);

comment on column person.dob is 'date of birth';
comment on column person.dod is 'date of death';

-- index: person_lastname_indx
-- drop index person_lastname_indx;

create index person_lastname_indx
  on person using btree
  (lastname collate pg_catalog."default" asc nulls last);



-- table: artist


-- table: member
create table member
(
  idperson uuid not null,
  idartist uuid not null,
  alias text,
  periods daterange[],
  constraint member_pkey primary key (idperson, idartist)
);

-- -----------

create table song (
  id uuid default uuidv7() primary key,
  title text not null,
  iswc text,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone
);

create table media (
  id uuid default uuidv7() primary key,
  release uuid not null,
  format character varying(10),
  quantity smallint default 1,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone
);

create table recording (
  isrc text not null,
  song uuid not null,
  artist uuid not null,
  length bigint,
  description text
);

create table release (
  id uuid default uuidv7() primary key,
  title text not null,
  date character varying(12)
);

create table track (
  media uuid default uuidv7() primary key,
  recording text not null,
  position integer,
  number character varying(3)
);

--
revoke all on schema public from PUBLIC;

grant usage on schema public to musique;
grant select, insert, update, delete on all tables in schema public to musique;

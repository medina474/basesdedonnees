create database musique;

\c musique;

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
  isrc character(15) not null,
  song uuid not null,
  artist uuid not null,
  length bigint,
  description character varying(30)
);
create table release (
  id uuid default uuidv7() primary key,
  title character varying(50) not null,
  date character varying(12)
);
create table track (
  media uuid default uuidv7() primary key,
  recording character(15) not null,
  position integer,
  number character varying(3)
);

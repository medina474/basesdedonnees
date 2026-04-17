\pset tuples_only on

drop database if exists market with (force);

-- Crée une nouvelle base nommée market.
create database market owner market;

\c market;

create extension if not exists ltree;


create table adherent (
  id int primary key,
  nom text,
  prenom text,
  genre smallint,
  naissance date,
  codepostal text
);

create table famille (
  code text primary key,
  famille text,
  code_parent text, -- references famille(code)
  arborescence ltree
);

create table article (
  code text primary key,
  article text,
  famille_code text, -- references famille(code)
  factpoids boolean,
  unitevente int,
  prix decimal,
  suivistock int
);

create table ticket (
  id int primary key,
  date_ticket timestamp,
  adherent_id int,    -- references adherent(id)
  mode_rglt int
);

create table ligne (
  id int primary key,
  ticket_id int,     -- references ticket (id),
  article_code text, -- references article (code)
  prix_unitaire decimal,
  quantite decimal
);

alter table ligne
  add column total decimal
  generated always as (prix_unitaire * quantite) stored;

copy adherent FROM '/tmp/market/adherent.csv' (FORMAT CSV, header, ENCODING 'UTF8');
copy famille FROM '/tmp/market/famille.csv' (FORMAT CSV, header, ENCODING 'UTF8');
copy article FROM '/tmp/market/article.csv' (FORMAT CSV, header, ENCODING 'UTF8');
copy ticket FROM '/tmp/market/ticket.csv' (FORMAT CSV, header, ENCODING 'UTF8');
copy ligne FROM '/tmp/market/ligne.csv' (FORMAT CSV, header, ENCODING 'UTF8');

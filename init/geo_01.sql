drop database if exists geo with (force);

-- Crée une nouvelle base nommée geo.
create database geo owner geo;

\c geo;

-- Extension spatiale qui ajoute des types géométriques, index spatiaux et fonctions géographiques.
-- Ne pas placer l'extension dans un schéma séparé car l'ORM Doctrine ne retouve pas les fonctions
create extension if not exists postgis;

-- Extension qui fournit des opérateurs B-tree compatibles avec les index complexes GiST
create extension if not exists btree_gist;

create extension if not exists ltree;

set role geo;

create table langue
(
  code text primary key,
  langue text not null,
  francais text not null,
  ltr boolean
);

/*
insert into langue values
('fra', 'Français', 'Français', true),
('eng', 'English', 'Anglais', true),
('deu', 'Deutsch', 'Allemand', true),
('spa', 'Español', 'Espagnol', true),
('por', 'Português', ' Portugais', true),
('ita', 'Italiano', 'Italien', true),
('nld', 'Nederlands', 'Néerlandais', true),
('swe', 'Svenska', 'Suédois', true),
('dan', 'Dansk', 'Danois', true),
('ltz','Luxembourgeois','Lëtzebuergesch', true);
*/
--

create table administration (
  id bigint primary key,
  administration text
);

create table subdivision (
  region_code text primary key,
  hierarchie ltree,
  region text not null,
  francais text,
  administration text,
  capitale text
);

comment on column subdivision.region_code is 'code ISO 3166-2. Codes pour la représentation des noms de pays et de leurs subdivisions – Partie 2';

create index path_gist_idx
  on subdivision using gist (hierarchie);

create index path_idx
  on subdivision using btree (hierarchie);

select 'Codes officiels géographiques ---------------------';

create table tncc (
  id smallint primary key,
  article text,
  charniere text
);

insert into tncc values
(0,'', 'de '),
(1,'', 'd'''),
(2,'le ','du '),
(3,'la ','de la '),
(4,'les ','des '),
(5,'l''','de l'''),
(6,'aux ','des '),
(7,'las ','de las '),
(8,'los ','de los ');

-- Commune

create table commune (
  id integer primary key,
  code_insee text,
  nom_standard text,           -- La Chapelle-du-Châtelard
  nom_sans_pronom text,        -- Chapelle-du-Châtelard
  nom_a text,nom_de text,      -- à Chapelle-du-Châtelard
  nom_sans_accent text,        -- la-chapelle-du-chatelard
  nom_standard_majuscule text, -- LA CHAPELLE-DU-CHÂTELARD
  typecom text,                -- toujours COM
  typecom_texte text,          -- toujours commune
  region text,                 -- code région
  dep_code text,               -- code département
  canton_code text,            -- code canton
  epci_code text,              -- communauté de commune
  academie_code text,          -- code académie
  code_postal text,
  codes_postaux text,
  zone_emploi text,
  code_insee_centre_zone_emploi text,
  code_unite_urbaine text,
  nom_unite_urbaine text,
  taille_unite_urbaine smallint,
  type_commune_unite_urbaine text,
  statut_commune_unite_urbaine text, -- I B C H
  population decimal(10,2),
  superficie_hectare decimal(10,2),
  superficie_km2 decimal(10,2),
  densite decimal(8, 2),
  altitude_moyenne decimal(8,2),
  altitude_minimale decimal(8,2),
  altitude_maximale decimal(8,2),
  mairie geometry(point, 4326) default null::geometry,
  centre geometry(point, 4326) default null::geometry,
  grille_densite smallint,
  grille_densite_texte text,
  niveau_equipements_services smallint,
  niveau_equipements_services_texte text,
  gentile text
);

-- Régions

create table region (
  code text primary key,
  region text,
  tncc smallint references tncc,
  cheflieu_code text,
  cheflieu text
);

-- Départements

create table departement (
  code text,
  region_code text,
  departement text,
  tncc smallint references tncc,
  cheflieu_code text,
  cheflieu text
);

-- Canton

create table canton (
  code text,
  canton text
);

-- Académie

create table academie (
  code text,
  region text
);

create table epci (
  code text primary key,
  epci text
);

--

set role postgres;

copy langue from '/tmp/commun/langues.csv' (format csv, header, delimiter ',', encoding 'utf8');

copy administration from '/tmp/commun/administrations.csv' (format csv, header, delimiter ',', encoding 'utf8');

copy subdivision from '/tmp/commun/regions.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/at.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/be.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/ch.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/de.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/dk.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/es.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/fi.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/fr.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/gb.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/gr.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/hr.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/hu.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/ie.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/it.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/lt.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/lu.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/nl.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/no.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/pl.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/pt.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/ro.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/se.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/ua.csv' (format csv, header, delimiter ',', encoding 'utf8');
copy subdivision from '/tmp/commun/us.csv' (format csv, header, delimiter ',', encoding 'utf8');
--

create temporary table commune_temp (
  id integer,
  code_insee text,
  nom_standard text,           -- La Chapelle-du-Châtelard
  nom_sans_pronom text,        -- Chapelle-du-Châtelard
  nom_a text,nom_de text,      -- à Chapelle-du-Châtelard
  nom_sans_accent text,        -- la-chapelle-du-chatelard
  nom_standard_majuscule text, -- LA CHAPELLE-DU-CHÂTELARD
  typecom text,                -- toujours COM
  typecom_texte text,          -- toujours commune
  reg_code text,                -- code région
  reg_nom text,
  dep_code text,               -- code département
  dep_nom text,
  canton_code text,            -- code canton
  canton_nom text,
  epci_code text,              -- communauté de commune
  epci_nom text,
  academie_code text,          -- code académie
  academie_nom text,
  code_postal text,
  codes_postaux text,
  zone_emploi text,
  code_insee_centre_zone_emploi text,
  code_unite_urbaine text,
  nom_unite_urbaine text,
  taille_unite_urbaine decimal(6, 2),
  type_commune_unite_urbaine text,
  statut_commune_unite_urbaine text, -- I B C H
  population decimal(10,2),
  superficie_hectare decimal(10,2),
  superficie_km2 decimal(10,2),
  densite decimal(8,2),
  altitude_moyenne decimal(8,2),
  altitude_minimale decimal(8,2),
  altitude_maximale decimal(8,2),
  latitude_mairie decimal(8,6),
  longitude_mairie decimal(8,6),
  latitude_centre decimal(8,6),
  longitude_centre decimal(8,6),
  grille_densite smallint,
  grille_densite_texte text,
  niveau_equipements_services decimal(6, 2),
  niveau_equipements_services_texte text,
  gentile text,
  url_wikipedia text,
  url_villedereve text
);

copy commune_temp
from '/tmp/communes-france-2025.csv' (format csv, header, encoding 'UTF8');

insert into commune
select id,
  code_insee,
  nom_standard,
  nom_sans_pronom,
  nom_a ,nom_de,
  nom_sans_accent,
  nom_standard_majuscule,
  typecom,
  typecom_texte,
  LPAD(reg_code, 2, '0'),
  dep_code,
  canton_code,
  epci_code,
  academie_code,
  code_postal,
  codes_postaux,
  zone_emploi,
  code_insee_centre_zone_emploi,
  code_unite_urbaine,
  nom_unite_urbaine,
  taille_unite_urbaine,
  type_commune_unite_urbaine,
  statut_commune_unite_urbaine,
  population,
  superficie_hectare,
  superficie_hectare / 100,
  population / superficie_hectare * 100,
  altitude_moyenne,
  altitude_minimale,
  altitude_maximale,
  'SRID=4326;POINT(' || longitude_mairie || ' ' || latitude_mairie || ')',
  'SRID=4326;POINT(' || longitude_centre || ' ' || latitude_centre || ')',
  grille_densite,
  grille_densite_texte,
  niveau_equipements_services::smallint,
  niveau_equipements_services_texte,
  gentile
from commune_temp;

--

create temporary table region_temp
(REG text, CHEFLIEU text, TNCC smallint, NCC text, NCCENR text, LIBELLE text);

copy region_temp
from '/tmp/code_officiel_geographique/v_region_2026.csv' (format csv, header, encoding 'UTF8');

insert into region (code, region, tncc, cheflieu_code)
select REG, LIBELLE, TNCC, CHEFLIEU from region_temp order by reg;

drop table region_temp;

--

create temporary table departement_temp
(DEP text, REG text, CHEFLIEU text, TNCC smallint, NCC text, NCCENR text, LIBELLE text);

copy departement_temp
from '/tmp/code_officiel_geographique/v_departement_2026.csv' (format csv, header, encoding 'UTF8');

insert into departement (code, region_code, departement, tncc, cheflieu_code)
select DEP, REG, LIBELLE, TNCC, CHEFLIEU from departement_temp order by reg;

drop table departement_temp;

--

insert into epci
select distinct epci_code, epci_nom from commune_temp where epci_code is not null order by epci_code;

insert into academie
select distinct academie_code, academie_nom from commune_temp order by academie_code;

insert into canton
select distinct canton_code, canton_code from commune_temp order by canton_code;

--

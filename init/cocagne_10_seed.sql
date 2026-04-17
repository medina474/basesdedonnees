\c cocagne;

\pset tuples_only on

create schema if not exists import authorization pg_database_owner;

-- Données générales

copy unite
from '/tmp/cocagne/commun/unite.csv' (format csv, header, encoding 'UTF8');

--

insert into jardin (jardin,tva,contact,telephone,email,adresse,code_postal,ville,localisation) values
  ('jardin de Cocagne Thaon les Vosges','FR42400245775','Émilie Gadaut','0329316498','contact@jdc-thaon.fr','Prairie Claudel','88150','Thaon-les-Vosges','SRID=4326;POINT(6.427672 48.2531016)');

insert into depot (id,depot,capacite,adresse,code_postal,ville,localisation) values
  (0,'Livraison à domicile',100, '', '', '', null),
  (1,'Jardins de Cocagne',100,'Prairie Claudel','88150','Thaon-les-Vosges','SRID=4326;POINT(6.427672 48.2531016)'),
  (2,'Asso Étudiant Universitaire',20,'9 rue de la Louvière','88000','Épinal','SRID=4326;POINT(6.4531588 48.1723212)'),
  (3,'Conseil Départemental des Vosges',20,'8 rue de la Préfecture','88000','Épinal','SRID=4326;POINT(6.4445154 48.1721724)'),
  (4,'Asso Rhyzome',20,'15 rue des Jardiniers','88000','Épinal','SRID=4326;POINT(6.452224 48.1706099)'),
  (6,'Pharmacie Saint Nabord',20,'24 rue du Gal de Gaulle','88200','St Nabord','SRID=4326;POINT(6.5807814 48.0510352)'),
  (8,'Denninger',25,'36 bis rue de la Plaine','88190','Golbey','SRID=4326;POINT(6.4426982 48.1929337)'),
  (9,'3e Rive (Café Associatif)',20,'15 rue du Maréchal Lyautey','88000','Épinal','SRID=4326;POINT(6.4457306 48.177777)'),
  (10,'Crédit Agricole',20,'Allée des Érables','88000','Épinal','SRID=4326;POINT(6.454908 48.203990)'),
  (12,'Centre Léo Lagrange',60,'6 av. Salvador Allende','88000','Épinal','SRID=4326;POINT(6.4599403 48.1938105)'),
  (13,'Boulassel Docelles',20,'1 rue Moncey','88460','Docelles','SRID=4326;POINT(6.6162166 48.1460719)'),
  (14,'Ligue de l’enseignement',40,'15 rue Général de Reffye','88000','Épinal','SRID=4326;POINT(6.4323215 48.1819469)'),
  (15,'Garage Renault- Station Service',20,'664 rue de la Gare','88550', 'Pouxeux','SRID=4326;POINT(6.5760129 48.1051197)'),
  (16,'Adinolfi',40,'7 allée des Primevères','88390','Les Forges','SRID=4326;POINT(6.397633 48.171791)'),
  (17,'Lecompte François',40,'24 route du Noirpré','88530','Le Tholy','SRID=4326;POINT(6.7477787 48.0812967)'),
  (18,'Papeterie Norske Skog',20,'ZI Route Charles Pellerin','88190','Golbey','SRID=4326;POINT(6.423976 48.208795)'),
  (19,'Botanic',20,'9 av. des Terres St Jean','88000','Épinal','SRID=4326;POINT(6.4692286 48.1891998)'),
  (20,'Pro & Cie',40,'7 rue de la République','88400','Gérardmer','SRID=4326;POINT(6.877433 48.074172)'),
  (21,'Mme Pierot Charmes',40,'15 rue Ste Barbe','88130','Charmes','SRID=4326;POINT(6.2951122 48.3777043)'),
  (25,'DVIS Epinal',20,'1 Rue de la Préfecture','88000','Épinal','SRID=4326;POINT(6.44875 48.172438)'),
  (26,'Peridon',20,'7 rue du Savron','88220','Raon-aux-Bois','SRID=4326;POINT(6.5036466 48.0504027)'),
  (31,'Chambre d’Agriculture',20,'17 rue André Vitu','88000','Épinal','SRID=4326;POINT(6.465403 48.1775685)'),
  (34,'Biocoop',20,'7 rue du Boudiou','88000','Épinal','SRID=4326;POINT(6.447245 48.174228)'),
  (36,'Moustaches Bikes',20,'5 rue du Ruisseau','88150','Thaon-les-Vosges','SRID=4326;POINT(6.4005773 48.2576491)'),
  (38,'Vosgelis Remiremont',20,'4 place de l’Abbaye','88200','Remiremont','SRID=4326;POINT(6.592068 48.015964)'),
  (42,'Église Saint Antoine',72,'12 rue Armand Colle','88000','Épinal','SRID=4326;POINT(6.4489619 48.1604568)'),
  (46,'Maison de l’Environnement',60,'12 rue  Raymond Poincaré','88000','Épinal','SRID=4326;POINT(6.449693 48.175374)'),
  (48,'Vosgelis',20,'8 quai Barbier','88000','Épinal','SRID=4326;POINT(6.445190 48.171198)'),
  (50,'Association GACI',20,'26 rue de la Joncherie','88200','Remiremont','SRID=4326;POINT(6.5934293 48.0189339)'),
  (55,'Brico Marché',35,'2 rue de Fraisne','88600','Bruyères','SRID=4326;POINT(6.7196903 48.2050495)'),
  (57,'Office du tourisme',20,'6 place C. Poncelet','88200','Remiremont','SRID=4326;POINT(6.5917178 48.0159918)'),
  (60,'Point Vert Mafra',20,'5 rue des Résistants Zac Barbazan','88600','Bruyères','SRID=4326;POINT(6.7208371 48.2032056)'),
  (61,'La Quarterelle',20,'3 rue Carterelle','88200','Épinal','SRID=4326;POINT(6.7208371 48.2032056)'),
  (62,'Léo Lagrange',20,'Chemin du Tambour Major','88000','Épinal','SRID=4326;POINT(6.7208371 48.2032056)'),
  (65,'Bouvier Emmanuel',20,'557 rue du Chêne','88220','Hadol','SRID=4326;POINT(6.484004 48.108499)'),
  (75,'APF - Local extérieur – ESAT',20,'rue de la papeterie','88000','Dinozé','SRID=4326;POINT(6.4738942 48.1383687)'),
  (77,'La tête à Toto',20,'26 quai des Bons Enfants','88000','Épinal','SRID=4326;POINT(6.4409549 48.1748623)'),
  (78,'UIMM',20,'Label Initiative','88150','Thaon les Vosges','SRID=4326;POINT (6.4409549 48.1748623)'),
  (80,'Résidence du Monsey',20,'Ruelle de Monsey', '88450', 'Vincey', 'SRID=4326;POINT(6.330850 48.337907)'),
  (81,'Complexe Sportif',60,'Bld Georges Clemenceau','88130','Charmes','SRID=4326;POINT(6.298452 48.375298)'),
  (83,'Fives',30,'2 rue des Amériques','88190','Golbey','SRID=4326;POINT(6.428831 48.200150)'),
  (84,'Nomexy Secours Catholique',20,'1 place de Verdun', '88440', 'Nomexy', 'SRID=4326;POINT(6.386527 48.305704)'),
  (85,'Réserve',20,'','','',null);

insert into armoire (depot_id, capacite, code) values
  (81, 30, 'A2569Y'),
  (81, 30, 'B7517Z');

insert into saison (id,jardin_id,saison,date_debut,date_fin) values
  (2020, 1, '2020', '2020-01-01', '2020-12-31'),
  (2021, 1, '2021', '2021-01-01', '2021-12-31'),
  (2022, 1, '2022', '2022-01-01', '2022-12-31'),
  (2023, 1, '2023', '2023-01-01', '2023-12-31'),
  (2024, 1, '2024', '2024-01-01', '2024-12-31'),
  (2025, 1, '2025', '2025-01-01', '2025-12-31'),
  (2026, 1, '2026', '2026-01-01', '2026-12-31');

select setval(pg_get_serial_sequence('saison', 'id'), max(id))
from saison;

-- Possibilité en 2023 de commander des panier à la carte la 51e semaine. Semaine non planifiée mais ouverte.

insert into fermeture (saison_id, semaine) values
  (2020,52),
  (2021,51),
  (2021,52),
  (2022,51),
  (2022,52),
  (2023,52),
  (2024,1),
  (2024,52),
  (2025,1),
  (2025,52),
  (2026,1),
  (2026,52),
  (2026,53);

copy ferie (saison_id, ferie, jour)
from '/tmp/cocagne/commun/ferie.csv' (format csv, header, encoding 'UTF8');

-- Adhérents

insert into profil (id, profil) values
  (1, 'adhérent'),
  (2, 'non adhérent'),
  (3, 'professionnel'),
  (4, 'salarié');

select setval(pg_get_serial_sequence('profil', 'id'), max(id))
from profil;

copy mode_paiement(id,mode_paiement,nombre)
from '/tmp/cocagne/mode_paiement.csv' (format csv, header, encoding 'UTF8');

create table import.adherent
(
  id            bigint,
  adherent      text,
  profil_id     bigint,
  depot_id      bigint,
  domicile      boolean,
  email         text,
  telephone     text,
  created_at    timestamp without time zone,
  date_sortie   date,
  adresse       text,
  code_postal   text,
  ville         text,
  date_adhesion date,
  mode_paiement_id bigint,
  cotisation    text,
  compta        text
);

copy import.adherent
from '/tmp/cocagne/adherents.csv' (format csv, header, encoding 'UTF8');

insert into adherent (id, adherent, profil_id, depot_id, email, telephone, adresse, code_postal, ville, compte_comptable, date_adhesion, date_sortie, mode_paiement_id, created_at)
  select id, adherent, profil_id, depot_id, email, telephone, adresse, code_postal, ville,
      compta,
      case when date_adhesion is null then created_at::date else date_adhesion end,
      date_sortie,
      mode_paiement_id,
      created_at
  from import.adherent;

select setval(pg_get_serial_sequence('adherent', 'id'), max(id))
from adherent;

--

insert into cotisation (saison_id, profil_id, montant, code) values
  (2020,1,30.0,'ACOT'),
  (2020,2,0.0,null),
  (2020,3,30.0,'ACOTPRO'),
  (2020,4,30.0,'ACOTSO'),
  (2021,1,30.0,'ACOT'),
  (2021,2,0.0,null),
  (2021,3,30.0,'ACOTPRO'),
  (2021,4,30.0,'ACOTSO'),
  (2022,1,30.0,'ACOT'),
  (2022,2,0.0,null),
  (2022,3,30.0,'ACOTPRO'),
  (2022,4,30.0,'ACOTSO'),
  (2023,1,30.0,'ACOT'),
  (2023,2,0.0,null),
  (2023,3,30.0,'ACOTPRO'),
  (2023,4,30.0,'ACOTSO'),
  (2024,1,5.0,'ACOT'),
  (2024,2,0.0,null),
  (2024,3,5.0,'ACOTPRO'),
  (2024,4,5.0,'ACOTSO'),
  (2025,1,5.0,'ACOT'),
  (2025,2,0.0,null),
  (2025,3,5.0,'ACOTPRO'),
  (2025,4,5.0,'ACOTSO'),
  (2026,1,5.0,'ACOT'),
  (2026,2,0.0,null),
  (2026,3,5.0,'ACOTPRO'),
  (2026,4,5.0,'ACOTSO');

update adherent set mode_paiement_id = 48
where mode_paiement_id is null and date_adhesion < '2026-12-15' and (date_sortie > '2023-01-06' or date_sortie is null);

--select a.id, a.adherent, date_sortie, created_at
--from adherent a, lateral adherer(a.id, 2023)
--where created_at < '2023-12-15' and (date_sortie > '2023-01-06' or date_sortie is null);

--select a.id, a.adherent, date_sortie, created_at
--from adherent a, lateral adherer(a.id, 2024)
--where created_at < '2024-12-15' and (date_sortie > '2024-01-06' or date_sortie is null);

--select a.id, a.adherent, date_sortie, created_at
--from adherent a, lateral adherer(a.id, 2025)
--where created_at < '2025-12-15' and (date_sortie > '2025-01-06' or date_sortie is null);

--select a.id, a.adherent, a.date_sortie
--from adherent a, lateral adherer(a.id, 2026)
--where created_at < '2026-12-15' and (date_sortie > '2026-01-06' or date_sortie is null);

--update adhesion as a
--set numero = i.cotisation
--from import.adherent i
--where a.adherent_id = i.id
--  and saison_id = 2026
--  and i.cotisation is not null;

--update adhesion set mode_paiement_id = null
--  where saison_id = 2026 and numero is null and montant = 0;

create table import.cotisation
(
  compta text,
  facture text,
  jour timestamp,
  article text,
  libelle text,
  qte numeric(12,4),
  pu numeric(12,4),
  montant numeric(12,4)
);

copy import.cotisation
from '/tmp/cocagne/sage/cotisations.csv' (format csv, header, delimiter ";", encoding 'UTF8');

insert into adhesion (adherent_id, date_adhesion, saison_id, mode_paiement_id, numero, montant)
select a.id, max(i.jour), extract(year from i.jour), a.mode_paiement_id,
  max(i.facture) as numero, sum(i.montant) as montant
from import.cotisation i
join adherent a on a.compte_comptable = i.compta
group by a.id, i.compta, extract(year from i.jour), a.mode_paiement_id
having sum(montant) <> 0;

-- produit
-- Quid de l'historique des prix ?

copy produit (id,produit,prix,marge,ordre,categorie,couleur,doublage_id)
from '/tmp/cocagne/produits.csv' (format csv, header, encoding 'UTF8');

select setval(pg_get_serial_sequence('produit', 'id'), max(id))
from produit;

copy panier (id,produit_id,panier,quantite,prix,domicile,actif,code)
from '/tmp/cocagne/paniers.csv' (format csv, header, encoding 'UTF8');

select setval(pg_get_serial_sequence('panier', 'id'), max(id))
from panier;

select 'Tournées ---------------------';

insert into calendrier (id,saison_id,calendrier) values
  (1,2023,'Livraisons du mardi'),
  (2,2023,'Livraisons du mercredi'),
  (3,2023,'Livraisons du jeudi'),
  (4,2023,'Livraisons du vendredi'),
  (5,2024,'Livraisons du mardi'),
  (6,2024,'Livraisons du mercredi'),
  (7,2024,'Livraisons du jeudi'),
  (8,2024,'Livraisons du vendredi'),
  (9,2025,'Livraisons du mardi'),
  (10,2025,'Livraisons du mercredi'),
  (11,2025,'Livraisons du jeudi'),
  (12,2025,'Livraisons du vendredi'),
  (13,2026,'Livraisons du mardi'),
  (14,2026,'Livraisons du mercredi'),
  (15,2026,'Livraisons du jeudi'),
  (16,2026,'Livraisons du vendredi');

select setval(pg_get_serial_sequence('calendrier', 'id'), max(id))
from calendrier;

copy planning (calendrier_id, jour) from '/tmp/cocagne/planning/planning-2023.csv' (format csv, header, encoding 'UTF8');
copy planning (calendrier_id, jour) from '/tmp/cocagne/planning/planning-2024.csv' (format csv, header, encoding 'UTF8');
copy planning (calendrier_id, jour) from '/tmp/cocagne/planning/planning-2025.csv' (format csv, header, encoding 'UTF8');
copy planning (calendrier_id, jour) from '/tmp/cocagne/planning/planning-2026.csv' (format csv, header, encoding 'UTF8');

insert into preparation (id, preparation, jour) values
  (1,'Mardi', 2),
  (2,'Jeudi', 4);

select setval(pg_get_serial_sequence('preparation', 'id'), max(id))
from preparation;

-- Charme passe du calendrier du vendredi au jeudi, booleen est il pertinent ?
-- Quid de l'historique si on change de calendrier ?
-- Désynchronisation du jour et de la tournée
-- Comment réaffecter les adhérents ?

insert into tournee values
  (1,'Mardi (Épinal)',1,1,1,'yellow', true),
  (2,'?',1,1,1,'yellow', true),
  (3,'Mercredi matin',1,2,3,'red', true),
  (4,'Mercredi après-midi',1,2,4,'pink', true),
  (5,'Mercredi (Jardins)',1,2,6,'purple', true),
  (6,'Salariés',2,3,8,'indigo', true),
  (7,'Vendredi (Épinal)',2,4,9,'azure', true),
  (8,'Vendredi (Jardins)',2,4,12,'lime', true),
  (9,'Charmes',2,4,7,'green', true),
  (10,'Gérardmer',2,4,10,'maroon', true),
  (11,'Mercredi (Ent.)',1,2,5,'gray-700', true),
  (12,'Vendredi (Ent.)',2,4,11,'khaki', false),
  (13,'Mardi (Épinal)',1,5,1,'yellow', true),
  (15,'Mercredi matin',1,6,3,'red', true),
  (16,'Mercredi après-midi',1,6,4,'pink', true),
  (17,'Mercredi (Jardins)',1,6,6,'purple', true),
  (18,'Salariés',2,7,8,'indigo', true),
  (19,'Vendredi (Épinal)',2,8,9,'azure', true),
  (20,'Vendredi (Jardins)',2,8,12,'lime', true),
  (21,'Charmes',2,7,7,'green', true),
  (22,'Gérardmer',2,8,10,'maroon', true),
  (23,'Mercredi (Ent.)',1,6,5,'gray-700', true),
  (24,'Vendredi (Ent.)',2,8,11,'khaki', false),
  (25,'Mardi (Épinal)',1,9,1,'yellow', true),
  (26,'Mardi (Jardins)',1,9,2,'orange', true),
  (27,'Mercredi matin',1,10,3,'red', true),
  (28,'Mercredi après-midi',1,10,4,'pink', true),
  (29,'Mercredi (Jardins)',1,10,6,'purple', true),
  (30,'Salariés',2,11,8,'indigo', true),
  (31,'Vendredi (Épinal)',2,12,9,'azure', true),
  (32,'Vendredi (Jardins)',2,12,12,'lime', true),
  (33,'Charmes',2,11,7,'green', true),
  (34,'Gérardmer',2,12,10,'maroon', true),
  (35,'Entreprises',1,10,5,'gray-700', true),
  (36,'Mercredi (Ent.)',1,2,5,'gray-700', false),
  (37,'Mardi (Épinal)',1,13,1,'yellow', true),
  (38,'Mardi (Jardins)',1,13,2,'orange', true),
  (39,'Mercredi matin',1,14,3,'red', true),
  (40,'Mercredi après-midi',1,14,4,'pink', true),
  (41,'Mercredi (Jardins)',1,14,6,'purple', true),
  (42,'Salariés',2,15,8,'indigo', true),
  (43,'Vendredi (Épinal)',2,16,9,'azure', true),
  (44,'Vendredi (Jardins)',2,16,12,'lime', true),
  (45,'Charmes',2,15,7,'green', true),
  (46,'Gérardmer',2,16,10,'maroon', true),
  (47,'Entreprises',1,14,5,'gray-700', true),
  (48,'Vendredi (Ent.)',2,4,11,'khaki', false);

select setval(pg_get_serial_sequence('tournee', 'id'), max(id))
from tournee;

copy point_distribution (tournee_id, depot_id, ordre)
from '/tmp/cocagne/point_distribution.csv' (format csv, header, encoding 'UTF8');

copy itineraire (tournee_id, depot_id, adherent_id, ordre)
from '/tmp/cocagne/itineraire.csv' (format csv, header, encoding 'UTF8');

-- Abonnements

select 'Abonnements ---------------------';

create table import.abonnement
(
  id               bigint primary key,
  adherent_id      bigint,
  panier_id        bigint,
  date_debut       date,
  nombre           smallint,
  montant          numeric(8, 2),
  mode_paiement_id bigint,
  saison_id        bigint,
  qte              smallint,
  mois_depart      smallint,
  mois_nb          smallint,
  nb_initial       smallint,
  piece            text,
  abonnement_id_prec bigint,
  reste_prec       smallint
);

copy import.abonnement from '/tmp/cocagne/abonnements/abonnements-2023.csv' (format csv, header, ENCODING 'UTF8');
copy import.abonnement from '/tmp/cocagne/abonnements/abonnements-2024.csv' (format csv, header, ENCODING 'UTF8');
copy import.abonnement from '/tmp/cocagne/abonnements/abonnements-2025.csv' (format csv, header, ENCODING 'UTF8');
copy import.abonnement from '/tmp/cocagne/abonnements/abonnements-2026.csv' (format csv, header, ENCODING 'UTF8');

update import.abonnement set mode_paiement_id = null where mode_paiement_id = 0;

insert into abonnement
select id,
  adherent_id,
  panier_id,
  date_debut,
  nombre,
  montant,
  mode_paiement_id,
  saison_id from import.abonnement;

--

insert into poste (id, poste) values
(1, 'directeur'),
(2, 'resp. admin. et financier'),
(3, 'resp. admin. et rh'),
(4, 'resp. production'),
(5, 'comptable'),
(6, 'encadrant TPS'),
(7, 'ouvrier maraîcher'),
(8, 'cuisinier'),
(9, 'employé technique'),
(10, 'assistant');

select setval(pg_get_serial_sequence('poste', 'id'), max(id))
from poste;

copy employe (id, prenom, nom, service, poste_id, actif)
from '/tmp/cocagne/employe.csv' (format csv, header, encoding 'UTF8');

select setval(pg_get_serial_sequence('employe', 'id'), max(id))
from employe;

--
insert into famille values
(0,'Indéterminée'),
(1,'Apiacées/Ombellifères'),
(2,'Labiées/Labiacées'),
(3,'Asteracées/Composées'),
(4,'Brassicacées/Crucifères'),
(5,'Liliacées'),
(6,'Rosacées'),
(7,'Cucurbitacées'),
(8,'Amaranthacées/chenopodiacées'),
(9,'Fabacées'),
(10,'Poacées'),
(11,'Solanacées'),
(12,'Montiacées'),
(13,'Valerianacées'),
(14,'Rubiacées'),
(15,'Boraginacées'),
(16,'Malvacées'),
(17,'Lauracées'),
(18,'Hypericacées'),
(19,'Urticacées'),
(20,'Polygonacées'),
(21,'Rutacées'),
(22,'Verbenacees'),
(23,'Indéterminée');

select setval(pg_get_serial_sequence('famille', 'id'), max(id))
from famille;

insert into categorie values
(2,'Achat légume/épicerie'),
(3,'Champignon'),
(4,'Légume'),
(5,'Transformé'),
(6,'Plant'),
(9,'Graine'),
(10,'Tubercule'),
(11,'Bulbe'),
(12,'Racine'),
(13,'Bouture'),
(14,'Aromate'),
(15,'Fruit'),
(16,'Mycélium'),
(17,'Fleur');

select setval(pg_get_serial_sequence('categorie', 'id'), max(id))
from categorie;

--

create table import.don
(
  compta text,
  doc text,
  jour timestamp,
  article text,
  libelle text,
  qte numeric(12,4),
  pu numeric(12,4),
  montant numeric(12,4),
  famille text
);

copy import.don
from '/tmp/cocagne/sage/dons.csv' (format csv, header, delimiter ";", encoding 'UTF8');

insert into don (adherent_id, montant, jour)
select a.id, d.montant, d.jour from import.don d
join adherent a on a.compte_comptable = d.compta order by jour asc;

-- Code Postal

select 'Codes postaux ---------------------';

create temporary table code_postal_temp (
  code_commune_INSEE text,
  nom_commune text,
  code_postal text,
  libelle text,
  ligne5 text,
  geopoint text,
  latitude text,
  longitude text
);

copy code_postal_temp
from '/tmp/base-officielle-codes-postaux.csv' (format csv, header, encoding 'UTF8');

insert into code_postal (code_insee, cp, commune, acheminement, ligne5)
select code_commune_INSEE, code_postal,
  nom_commune,
  case when libelle <> nom_commune then libelle else null end,
  ligne5
--  ST_SetSRID('POINT('||longitude||' '||latitude||')', 4326)
from code_postal_temp;

-- Contours
--  ST_SetSRID(ST_GeomFromGeoJSON(contour), 4326)

create table import.code_postal (
  code_commune_INSEE text,
  nom_commune text,
  code_postal text,
  libelle text,
  ligne5 text,
  contour text
);

copy import.code_postal
from '/tmp/datanova/019HexaSmal-full.csv' (format csv, header, encoding 'UTF8');

insert into code_postal_contour
select code_postal, st_union(ST_SetSRID(ST_GeomFromGeoJSON(contour), 4326))
  from import.code_postal
  group by code_postal;

-- Commandes de panier
-- --------------------------------------------------------------------------------

select 'Paniers ---------------------';

create table import.panier_commande
(
 id bigint,
 jour date,
 semaine smallint,
 jour_semaine text,
 type_panier text,
 prix numeric(8,2),
 qte numeric(8,2)
);

copy import.panier_commande
from '/tmp/cocagne/access/paniers_commandes.csv' (format csv, header, encoding 'UTF8');

with import as
(
select
id,
case
  when lower(jour_semaine) = 'mardi' then 1
  when lower(jour_semaine) = 'mercredi' then 1
  when lower(jour_semaine) = 'jeudi' then 2
  when lower(jour_semaine) = 'vendredi' then 2
end as preparation_id,
case
  when lower(type_panier) = 'simple'   then 1
  when lower(type_panier) = 'familial' then 2
  when lower(type_panier) = 'fruité1'  then 3
  when lower(type_panier) = 'fruité2'  then 4
  when lower(type_panier) = 'fruité3'  then 5
  when lower(type_panier) = 'mixte 1'  then 8
  when lower(type_panier) = 'mixte 2'  then 9
  when lower(type_panier) = 'mixte 3'  then 10
end as produit_id,
extract(year from jour) as annee,
extract(week from jour) as semaine,
case
  when lower(jour_semaine) = 'mardi' then date_trunc('week', jour) + interval '1 day'
  when lower(jour_semaine) = 'mercredi' then date_trunc('week', jour) + interval '1 day'
  when lower(jour_semaine) = 'jeudi' then date_trunc('week', jour) + interval '3 day'
  when lower(jour_semaine) = 'vendredi' then date_trunc('week', jour) + interval '3 day'
end as jour,
  qte,
  prix as montant,
  case
    when jour < current_date then jour
    else current_date
  end as created_at
from import.panier_commande
)
insert into panier_commande (id, preparation_id, produit_id, annee, semaine, jour, qte, montant, created_at)
select id, preparation_id, produit_id, annee, semaine, jour, qte, montant,
 case
    when created_at > jour then jour
    else jour
  end as created_at
from import
where produit_id is not null
  and preparation_id is not null;

update panier_commande pc
set cible = p.prix
from produit p
where p.id = pc.produit_id;

create table import.panier_composition
(
  panier bigint,
  code_veg bigint,
  lib_veg text,
  lib_veg_MAJ text,
  prix_veg decimal(8,2),
  qte_panier decimal(8,2),
  qte_panier_arrondie decimal(8,2)
);

copy import.panier_composition
from '/tmp/cocagne/access/paniers_compositions.csv' (format csv, header, encoding 'UTF8');

insert into panier_composition (panier_commande_id, produit_id, qte, montant)
select panier, code_veg, qte_panier_arrondie, prix_veg
from import.panier_composition
left join article a on code_veg = a.id
join panier_commande on panier_commande.id = import.panier_composition.panier
where prix_veg is not null
  and a.id is not null
  and panier_commande.id is not null
order by panier asc;

update  panier_commande c
set montant =
(
  select sum(p.montant * p.qte) as m
  from panier_composition p
  where p.panier_commande_id = c.id
);

-- GPAO
-- --------------------------------------------------------------------------------

copy etape
from '/tmp/cocagne/access/etapes.csv' (format csv, header, encoding 'UTF8');

create table import.action
(
  id            bigint,
  action        text,
  ordre         int,
  etape_id      bigint,
  actif         boolean not null default true,
  utilise       boolean  not null default true,
  article       bigint,
  sens          smallint
);

copy import.action
from '/tmp/cocagne/access/actions.csv' (format csv, header, encoding 'UTF8');

insert into action
select
  id,
  action,
  ordre,
  etape_id,
  actif,
  utilise,
  article,
  case when sens = 1 then 1 when sens = 2 then -1 else 0 end as s
from import.action;

create table import.fournisseur
(
  id bigint,
  fournisseur    text not null,
  libelle_court  text,
  contact        text,
  adresse        text,
  code_postal    text,
  ville          text,
  email          text,
  telephone      text,
  fax            text,
  type_article   text,
  categorie      text,
  telephone_contact text,
  reference      text,
  commentaire    text,
  siren          text,
  tva            text,
  iban           text,
  logo           text,
  compta         text
);

copy import.fournisseur
from '/tmp/cocagne/access/JDC _ Fournisseur BD.csv' (format csv, header, encoding 'UTF8');

insert into fournisseur
select
  id,
  fournisseur,
  contact,
  adresse,
  code_postal,
  ville,
  email,
  telephone,
  type_article,
  categorie,
  telephone_contact,
  reference,
  commentaire,
  siren,
  tva,
  iban,
  compta
 from import.fournisseur;

copy "resistance"
from '/tmp/cocagne/resistance.csv' (format csv, header, encoding 'UTF8');


-- Article

create table import.article
(
  id            bigint primary key,
  article       text not null,
  categorie     int,
  famille            int,
  nom_botanique      text,
  caracteristique    text,
  unite              text,
  unit_caisse        text,
  duree_conservation int,
  duree_tempo        int,
  actif              boolean not null default true,
  poids_unitaire     text,
  volume_unitaire    text,
  contenant          int,
  nb_graines         numeric(12,2),
  tri_poids          smallint,
  tri_salissure      smallint,
  conditionnement    text,
  membrane           text,
  recette            text,
  code_vege_produit  bigint,
  fournisseur_id     bigint,
  ref_fournisseur    text,
  tarif_1_fourni     numeric(8,2),
  tarif_2_fourni     numeric(8,2),
  tva_fourn          numeric(4,2),
  origine text,
  photo text,
  ar_ref_sage text,
  bio text,
  vente_veg text,
  date_maj date
);

copy import.article
from '/tmp/cocagne/access/JDC _ Végétal BD.csv' (format csv, header, encoding 'UTF8');

update import.article
set fournisseur_id = 1
where fournisseur_id = 70;

update import.article
set article = 'Tomate ' || article
where famille = 11
and nom_botanique = 'Solanum lycopersicum'
and upper(article) not like '%TOMATE%';

update import.article
set article = 'Poivron ' || article
where famille = 11
and nom_botanique = 'Capsicum annuum'
and upper(article) not like '%POIVRON%';

update import.article
set vente_veg =
  case
    when lower(vente_veg) = 'pas commercialisé' then '0'
    when lower(vente_veg) = 'particulier' then '1'
    when lower(vente_veg) = 'professionnel et particulier' then '2'
    when lower(vente_veg) = 'professionnel' then '3'
    else lower(vente_veg)
  end;

update import.article
set unite =
  case
    when lower(unite) = 'graines' then 'GRN'
    when lower(unite) = 'pièce(s)' then 'PCE'
    when lower(unite) = 'kg' then 'KGM'
    when lower(unite) = 'gramme' then 'GRM'
    when lower(unite) = 'g' then 'GRM'
    when lower(unite) = 'litre' then 'LTR'
    else unite
  end;

insert into article
select id,
  article,
  categorie,
  famille,
  nom_botanique,
  caracteristique,
  unite,
  unit_caisse,
  duree_conservation,
  duree_tempo,
  actif,
  poids_unitaire,
  volume_unitaire,
  contenant,
  nb_graines,
  tri_poids,
  tri_salissure,
  conditionnement,
  membrane,
  recette,
  code_vege_produit,
  fournisseur_id,
  ref_fournisseur,
  tarif_1_fourni,
  tarif_2_fourni,
  tva_fourn,
  country.code,
  bio,
  vente_veg,
  date_maj
from import.article
left join country on country.country = import.article.origine;

select setval(pg_get_serial_sequence('article', 'id'), max(id))
from article;

insert into fournisseur_prix (article_id , fournisseur_id, ref_fournisseur, tarif)
select id, fournisseur_id, ref_fournisseur, tarif_1_fourni
from import.article
where fournisseur_id is not null and fournisseur_id <> 1;

copy "article_produit"
from '/tmp/cocagne/access/JDC _ Végétal produit.csv' (format csv, header, encoding 'UTF8');
--

create table import.stock
(
  id            bigint,
  article_id    bigint,
  materiel_id   bigint,
  fournisseur_id   bigint not null,
  date_entree   date,
  qte           numeric(12, 2),
  unite         text,
  unite_contenant text,
  contenant     text,
  qte_contenant decimal(12,2),
  montant_ht    decimal(8, 2),
  montant_ttc   decimal(8, 2),
  numero        text,
  lot           text,
  zone          text,
  stock         text,
  caracteristique text
);

copy import.stock
from '/tmp/cocagne/access/JDC _ Stock.csv' (format csv, header, encoding 'UTF8');

update import.stock
set fournisseur_id = 1
where fournisseur_id = 70;

insert into stock
select id,
  article_id,
  materiel_id,
  fournisseur_id,
  date_entree,
  qte,
  unite,
  unite_contenant,
  contenant,
  qte_contenant,
  montant_ht,
  montant_ttc,
  numero,
  lot,
  zone,
  stock,
  caracteristique
from import.stock;

create table import.mouvement
(
  id          bigint,
  jour        date,
  sens        smallint,
  qte         numeric(12, 2)
);

copy import.mouvement
from '/tmp/cocagne/access/JDC _ Mouvement.csv' (format csv, header, encoding 'UTF8');

insert into mouvement (stock_id, jour, sens, qte)
select id, jour,
  case when sens = 1 then 1 else -1 end as s,
  qte from import.mouvement;

create table import.plan_culture
(
  id bigint,
  article_id bigint,
  action_id bigint,
  materiel_id bigint,
  stock bigint,
  plan_palette int,
  memo text,
  main_oeuvre int,
  rendement numeric(8, 3),
  nb_graine int,
  vegetal bigint,
  semaine_debut smallint,
  semaine_fin smallint,
  action2_id numeric(12,2),
  rendement2 numeric(8, 3),
  anticipation numeric(12,2),
  hebdomadaire int,
  actif boolean,
  conversion numeric(8, 3),
  updated_at  timestamp(0) with time zone default NULL::timestamp(0) with time zone
);

copy import.plan_culture
from '/tmp/cocagne/access/JDC _ Plan de culture.csv' (format csv, header, encoding 'UTF8');

insert into plan_culture ( id,
  article_id,
  action_id,
  materiel_id,
  stock,
  plan_palette,
  memo,
  main_oeuvre,
  rendement,
  nb_graine,
  vegetal,
  semaine_debut,
  semaine_fin,
  action2_id,
  rendement2,
  anticipation,
  hebdomadaire,
  actif,
  conversion,
  updated_at
  )
select
  id,
  article_id,
  action_id,
  materiel_id,
  stock,
  plan_palette,
  memo,
  main_oeuvre,
  rendement,
  nb_graine,
  vegetal,
  semaine_debut,
  semaine_fin,
  action2_id,
  rendement2,
  anticipation,
  hebdomadaire,
  actif,
  conversion,
  updated_at
from import.plan_culture;

copy achat
from '/tmp/cocagne/access/JDC _ Achat.csv' (format csv, header, encoding 'UTF8');

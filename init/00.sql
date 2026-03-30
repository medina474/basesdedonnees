-- PostgREST

-- postgrest est le rôle (avec un mot de passe de login) utilisé par l'application pour se connecter à la base.
-- Il doit être configuré pour avoir un accès très limité.
-- Il s'agit d'un caméléon dont la tâche est de « devenir » un autre utilisateur pour servir des requêtes HTTP authentifiées.

create role postgrest noinherit login password '9012';

-- Roles sans mot de passe de login.
-- Il faut se connecter d'abord avec l'utilisateur postgrest.
-- Puis celui-ci usurpe une des identités suivantes suivant le role présent dans le JWT.
-- Lorsqu'une demande contient un JWT valide avec une revendication de rôle,
-- PostgREST passera au rôle de base de données avec ce nom pendant la durée de la demande HTTP.
-- SET LOCAL ROLE adherent;

-- Rôle invité anonyme public, par défaut si auncun JWT avec role n'a été fourni
create role guest nologin;

-- L'utilisateur postgrest peut se connecter en tant que ...
grant guest to postgrest;

-- Anonymizer

-- Active le masquage statique fourni par l'extension anon (PostgreSQL Anonymizer)
-- Le masquage statique réécrit de manière permanente les données.
alter system set anon.static_masking to on;

-- Roles
create role cocagne noinherit login password '9845';
create role adventureworks noinherit login password '9176';
create role market noinherit login password '9637';
create role cinema noinherit login password '9084';
create role musique noinherit login password '9671';

select * from pg_user;

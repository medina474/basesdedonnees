-- PostgREST

-- postgrest est le rôle (avec un mot de passe de login) utilisé par l'application pour se connecter à la base.
-- Il doit être configuré pour avoir un accès très limité.
-- Il s'agit d'un caméléon dont la tâche est de « devenir » un autre utilisateur pour servir des requêtes HTTP authentifiées.

create role postgrest
  nosuperuser nocreatedb nocreaterole noinherit noreplication nobypassrls
  login password '9012';

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

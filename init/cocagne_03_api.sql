\c cocagne

-- PostgREST

-- postgrest est le rôle (avec un mot de passe de login) utilisé par l'application pour se connecter à la base.
-- Il doit être configuré pour avoir un accès très limité.
-- Il s'agit d'un caméléon dont la tâche est de « devenir » un autre utilisateur pour servir des requêtes HTTP authentifiées.

create role postgrest nosuperuser nocreatedb nocreaterole noinherit noreplication nobypassrls
  login password '9012';

-- Roles sans mot de passe de login.
-- Il faut se connecter d'abord avec l'utilisateur postgrest.
-- Puis celui-ci usurpe une des identités suivantes suivant le role présent dans le JWT.
-- Lorsqu'une demande contient un JWT valide avec une revendication de rôle,
-- PostgREST passera au rôle de base de données avec ce nom pendant la durée de la demande HTTP.
-- SET LOCAL ROLE adherent;
create role anonyme nologin;
create role adherent nologin;
create role salarie nologin;
create role livreur nologin;
create role comptable nologin;

-- L'utilisateur postgrest peut se connecter en tant que ...
grant anonyme to postgrest;
grant adherent to postgrest;
grant salarie to postgrest;
grant livreur to postgrest;
grant comptable to postgrest;

-- Schéma
create schema api authorization pg_database_owner;

-- Donner l'accès aux objets du schéma
grant usage on schema api to anonyme;
grant usage on schema extensions to anonyme;

grant usage on schema api to livreur;
grant usage on schema extensions to livreur;

-- --------------------------------------------------------------------------------

create or replace view api.jardin with (security_invoker = true) as
  select *
  from jardin;

grant select on api.jardin, public.jardin
to anonyme;
-- --------------------------------------------------------------------------------

create or replace view api.saison with (security_invoker = true) as
  select s.id, s.saison, s.date_debut, s.date_fin
  from saison s;

grant select on api.saison
to anonyme, adherent, salarie, livreur, comptable;

grant select on public.saison
to anonyme, adherent, salarie, livreur, comptable;

grant select on public.saison
to anonyme;

create or replace view api.ferie with (security_invoker = true) as
  select f.jour, f.saison_id, f.ferie
  from ferie f;

grant select on api.ferie
to anonyme, adherent, salarie, livreur, comptable;

grant select on public.ferie
to anonyme, adherent, salarie, livreur, comptable;

create or replace view api.fermeture with (security_invoker = true) as
  select f.id, f.saison_id, f.semaine
  from fermeture f;

grant select on api.fermeture
to anonyme, adherent, salarie, livreur, comptable;

grant select on public.fermeture
to anonyme, adherent, salarie, livreur, comptable;

create or replace view api.cotisation with (security_invoker = true) as
  select id, saison_id, profil_id, montant
  from cotisation;

grant select on api.cotisation
to anonyme;

grant select on public.cotisation
to anonyme;
-- --------------------------------------------------------------------------------



-- --------------------------------------------------------------------------------

create or replace view api.depot with (security_invoker = true) as
  select d.id, d.depot,
  d.contact, d.telephone, d.adresse, d.code_postal, d.ville, d.localisation
  from depot d;

grant select on api.depot
to anonyme, adherent, salarie, livreur, comptable;

grant select on public.depot
to anonyme, adherent, salarie, livreur, comptable;

create or replace view api.adherent with (security_invoker = true) as
  select a.id, a.adherent, a.profil_id, a.depot_id, a.email, a.telephone,
  a.date_sortie, a.adresse, a.code_postal, a.ville
  from adherent a;

grant select on api.adherent
to livreur, comptable;

grant select on public.adherent
to livreur, comptable;


grant select on api.adherent
to anonyme;

grant select on public.adherent
to anonyme;

create or replace view api.adhesion with (security_invoker = true) as
  select a.id, a.adherent_id, a.date_adhesion, a.montant, a.saison_id
  from adhesion a;

grant select on api.adhesion
to comptable;

grant select on public.adhesion
to comptable;

grant select on public.adhesion, api.adhesion
to anonyme;

create or replace view api.tournee with (security_invoker = true) as
  select *
  from tournee;

grant select on api.tournee, public.tournee
to anonyme;


create or replace view api.distribution with (security_invoker = true) as
  select *
  from distribution;

grant select on api.distribution, public.distribution
to anonyme;

grant update (validated_at) on api.distribution, public.distribution
to anonyme;

CREATE OR REPLACE FUNCTION api.reset_distribution()
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  update distribution
  set validated_at = null, livre = 'à livrer';
END;
$$;

GRANT EXECUTE ON FUNCTION api.reset_distribution() TO anonyme;

create or replace view api.panier with (security_invoker = true) as
  select *
  from panier;

grant select on api.panier, public.panier
to anonyme;

create or replace view api.produit with (security_invoker = true) as
  select *
  from produit;

grant select on api.produit, public.produit
to anonyme;


create or replace view api.abonnement with (security_invoker = true) as
  select *
  from abonnement;

grant select on api.abonnement, public.abonnement
to anonyme;


create or replace view api.adhesion with (security_invoker = true) as
  select *
  from adhesion;

grant select on api.adhesion, public.adhesion
to anonyme;


create or replace view api.profil with (security_invoker = true) as
  select *
  from profil;

grant select on api.profil, public.profil
to anonyme;

create or replace view api.livraison with (security_invoker = true) as
  select *
  from livraison;

grant select on api.livraison, public.livraison
to anonyme;


create or replace view api.mode_paiement with (security_invoker = true) as
  select *
  from mode_paiement;

grant select on api.mode_paiement, public.mode_paiement
to anonyme;


create or replace view api.planning with (security_invoker = true) as
  select *
  from planning;

grant select on api.planning, public.planning
to anonyme;


create or replace view api.preparation with (security_invoker = true) as
  select *
  from preparation;

grant select on api.preparation, public.preparation
to anonyme;

grant select on api.preparation, public.preparation
to anonyme;

grant insert, update, delete on api.preparation, public.preparation
to anonyme;
-- --------------------------------------------------------------------------------

create or replace view api.calendrier with (security_invoker = true) as
  select *
  from calendrier;

grant select on api.calendrier, public.calendrier
to anonyme;

-- --------------------------------------------------------------------------------

create or replace view api.itineraire with (security_invoker = true) as
  select *
  from itineraire;

grant select on api.itineraire, public.itineraire
to anonyme;
-- --------------------------------------------------------------------------------

create or replace view api.saisons
as
select
  s.id,
  s.saison,
  s.date_debut,
  s.date_fin,
  (
    select jsonb_agg(f.semaine)
    from fermeture f
    where f.saison_id = s.id
  ) as semaines_fermeture,
  (
    select jsonb_agg(fe.jour)
    from ferie fe
    where fe.saison_id = s.id
  ) as jours_feries,
  (
    select jsonb_agg(jsonb_build_object('profil_id', ct.profil_id, 'profil', p.profil, 'montant', ct.montant))
    from cotisation ct
    join profil p on p.id = ct.profil_id
    where ct.saison_id = s.id
  ) as cotisations
from saison s;

grant select on api.saisons
to anonyme;

create or replace view public.tournees
as
select t.id as tournee_id, tournee, preparation_id, t.ordre as ordre1, t.couleur,
  c.id as calendrier_id, c.calendrier,
  i.id as itineraire_id, i.depot_id, i.adherent_id,
  case when i.depot_id is null then true else false end as domicile,
  case when i.depot_id is null then a.adherent else d.depot end as lieu,
  i.ordre as ordre2
from tournee t
join calendrier c on c.id = t.calendrier_id
join itineraire i on i.tournee_id = t.id
left join depot d on d.id = i.depot_id
left join adherent a on a.id = i.adherent_id;



create or replace view api.tournees
as
select t.id as tournee_id, tournee, preparation_id, t.ordre as ordre1, t.couleur,
  c.id as calendrier_id, c.calendrier,
  (
    select jsonb_agg(
      jsonb_build_object(
        'itineraire_id', i.id,
        'depot_id', i.depot_id,
        'adherent_id', i.adherent_id,
        'domicile', case when i.depot_id is null then true else false end,
        'lieu', case when i.depot_id is null then a.adherent else d.depot end,
        'ordre', i.ordre
      )
      order by i.ordre
    )
    from itineraire i
    left join depot d on d.id = i.depot_id
    left join adherent a on a.id = i.adherent_id
    where i.tournee_id = t.id
  ) as itineraire
from tournee t
join calendrier c on c.id = t.calendrier_id;

grant select on api.tournees
to anonyme;

-- --------------------------------------------------------------------------------

security label for anon
  on role anonyme is 'masked';

security label for anon
  on column api.adherent.email
  is 'masked with function anon.pseudo_email(id)';

security label for anon
  on column api.adherent.telephone
  is 'masked with function anon.random_phone()';

select pg_class.relname as table, provider, pg_seclabel.label
from pg_seclabel
inner join pg_class on pg_seclabel.objoid = pg_class.oid;

-- --------------------------------------------------------------------------------

notify pgrst, 'reload schema';

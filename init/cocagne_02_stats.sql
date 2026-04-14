\c cocagne;

-- Adhérents

create or replace view stats.nb_adherents_profil with (security_invoker=on) as
select p.profil, count(adherent.*) as nb_adherents
from adherent
left join profil p on p.id = adherent.profil_id
group by p.profil;

comment on view stats.nb_adherents_profil
  is 'Nombre total d''adhérents par profils.';

create or replace view stats.nb_adherents_profil_actifs with (security_invoker=on) as
select p.profil,
  count(adherent.*) as nb_adherents
from adherent
left join profil p on p.id = adherent.profil_id
  where adherent.date_sortie is null
  group by p.profil;

comment on view stats.nb_adherents_profil_actifs
  is 'Nombre total d''adhérents actifs par profils.';

-- Dépôts



-- Abonnements

create or replace view stats.nb_abonnements with (security_invoker=on) as
select saison_id, count(*) as nb_abonnements
from abonnement
  group by saison_id;

comment on view stats.nb_abonnements
  is 'Nombre total d''abonnements par saisons.';

create or replace view stats.nb_abonnements_panier with (security_invoker=on) as
select saison_id, p.panier, count(*) as nb_abonnements
from abonnement a
join panier p on p.id = a.panier_id
  group by a.saison_id, p.panier;

comment on view stats.nb_abonnements_panier
  is 'Nombre total d''abonnements par saisons et par paniers.';

create or replace view stats.nb_abonnements_produit with (security_invoker=on) as
select saison_id, pp.produit, count(*) as nb_abonnements
from abonnement a
join panier p on p.id = a.panier_id
join produit pp on pp.id = p.produit_id
  group by a.saison_id, pp.produit;

comment on view stats.nb_abonnements_produit
  is 'Nombre total d''abonnements par saisons et par produits.';



-- Calendrier

create or replace view stats.nb_saisons with (security_invoker=on) as
select count(*) as nb_saisons
from saison s;

comment on view stats.nb_saisons
  is 'Nombre total de saisons.';


create or replace view stats.nb_calendriers_saison with (security_invoker=on) as
select
s.id as saison_id, s.saison,
count(c.id) as nb_calendriers
from saison s
left join calendrier c on c.saison_id = s.id
group by s.id;

comment on view stats.nb_calendriers_saison
  is 'Nombre total de calendriers par saisons.';


create or replace view stats.nb_tournees_saison with (security_invoker=on) as
select
s.id as saison_id, s.saison,
c.id as calendrier_id, c.calendrier,
count(t.id) as nb_tournees
from saison s
left join calendrier c on c.saison_id = s.id
left join tournee t on t.calendrier_id = c.id
group by s.id, c.id;

comment on view stats.nb_tournees_saison
  is 'Nombre total de calendriers par saisons.';


create or replace view stats.nb_points_distribution with (security_invoker=on) as
select
s.id as saison_id, s.saison,
c.id as calendrier_id, c.calendrier,
t.id as tournee_id, t.tournee,
count(i.id) as nb_points_distribution
from saison s
left join calendrier c on c.saison_id = s.id
left join tournee t on t.calendrier_id = c.id
left join itineraire i on i.tournee_id = t.id
group by s.id, c.id, t.id;

comment on view stats.nb_tournees_saison
  is 'Nombre total de points de distribution par itinéraires, tournées, calendrier, saisons.';

-- A revoir

create or replace view stats.nb_livraisons_depot_calendrier with (security_invoker=on) as
select l.depot_id, d.depot, c.calendrier, count(l.id)
from livraison l
join tournee t on t.id = l.tournee_id
join calendrier c on c.id = t.calendrier_id
left join depot d on d.id = l.depot_id
group by l.depot_id, d.depot, c.calendrier
order by depot_id;

comment on view stats.nb_livraisons_depot_calendrier
  is 'Nombre total de livraisons par dépots et par calendrier.';

-- --------------------------------------------------------------------------------

create view stats.nb_livraison_a_venir with (security_invoker=on)
  as
select
  l.id as livraison_id, l.qte, l.livre,
  l.jour
from livraison l
where livre = 'à livrer';

comment on view stats.nb_livraison_a_venir
  is 'Nombre total de livraisons à venir.';

-- --------------------------------------------------------------------------------

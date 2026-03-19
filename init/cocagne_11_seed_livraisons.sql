\c cocagne;

create temporary table livraison_import (
  livraison_id  bigint,
  abonnement_id bigint,
  qte           numeric,
  livre         smallint,
  depot_id      int,
  adherent_id   bigint,
  annee         int,
  jour          date,
  produit_id    int,
  semaine       smallint,
  tournee_id    smallint
);

copy livraison_import from '/tmp/livraisons/livraisons-2023.csv' (format csv, header, encoding 'UTF8');
copy livraison_import from '/tmp/livraisons/livraisons-2024.csv' (format csv, header, encoding 'UTF8');
copy livraison_import from '/tmp/livraisons/livraisons-2025.csv' (format csv, header, encoding 'UTF8');
copy livraison_import from '/tmp/livraisons/livraisons-2026.csv' (format csv, header, encoding 'UTF8');

-- Corrections

-- Toutes les livraisons avant 2026 sont livrées.
update livraison_import set livre = 1 where livre = 0 and annee < 2026;

-- Ajuster le n° de tournée en fonction de l'année
update livraison_import set tournee_id = tournee_id + 12 where annee = 2024;
update livraison_import set tournee_id = tournee_id + 24 where annee = 2025;
update livraison_import set tournee_id = tournee_id + 36 where annee = 2026;

-- La tournée 15 au mardi au lieu du mercredi
update livraison_import set jour = jour + interval '1 day' where tournee_id = 15 and extract(dow from jour) = 2;

-- Décalés les livraisons le 1er et 8 mai
update livraison_import set jour = jour + interval '-1 day' where jour in ('2024-05-01', '2024-05-08');

-- L'adhérent Reserve n'est pas à Domicile mais au Jardin
update livraison_import set depot_id = 1 where adherent_id = 259018;

delete from livraison_import where abonnement_id = 27791;

-- 1. Les livraisons sans tournées correspondantes
select i.livraison_id, abonnement_id, annee
from livraison_import i
left join tournee t on t.id = i.tournee_id
  where t.id is null;

-- 2. Les abonnements sans produits correspondants
select annee, abonnement_id, count(livraison_id)
from livraison_import
  where produit_id is null
  group by annee, abonnement_id;

-- 3. Les livraisons sans points de distribution
select annee, i.tournee_id, i.depot_id, count(i.livraison_id)
from livraison_import i
  join tournee t on t.id = i.tournee_id
  left join point_distribution pd on pd.tournee_id = i.tournee_id and pd.depot_id = i.depot_id
  where produit_id is not null and pd.tournee_id is null
  group by annee, i.tournee_id, i.depot_id;

-- 4. les jours de livraison qui ne sont pas dans le calendrier
select annee, t.calendrier_id, i.jour, count(i.livraison_id)
from livraison_import i
  join tournee t on t.id = i.tournee_id
  left join planning pl on pl.jour = i.jour and pl.calendrier_id = t.calendrier_id
  where produit_id is not null and pl.jour is null
  group by annee, t.calendrier_id, i.jour;

-- 5. nombre de livraison par tournee
select tournee.id, tournee, count(livraison_id) as nb
from tournee
left join livraison_import on livraison_import.tournee_id = tournee.id
group by tournee.id
having count(livraison_id)  = 0;

-- La jointure sur les points de distribution s'assure que le couple tournée/dépôt existe

insert into livraison (id, abonnement_id, tournee_id, depot_id, produit_id, qte, livre, calendrier_id, jour)
select
  i.livraison_id,
  i.abonnement_id,
  i.tournee_id,
  i.depot_id,
  i.produit_id,
  i.qte,
  case
    when livre = 0 then 'à livrer'::etat_livraison
    else 'livré'::etat_livraison
  end as livre,
  t.calendrier_id,
  i.jour
from livraison_import i
  join tournee t on t.id = i.tournee_id
  join point_distribution pd on pd.tournee_id = i.tournee_id and pd.depot_id = i.depot_id
  join planning p on p.jour = i.jour and p.calendrier_id = t.calendrier_id
  where produit_id is not null
order by i.abonnement_id, i.semaine;

select setval(pg_get_serial_sequence('livraison', 'id'), max(id))
from livraison;

-- livraison_import = 200 452
select count(*) from livraison_import;
select annee, count(*) from livraison_import group by annee;

-- livraison        = 200 331
select count(*) from livraison;

-- drop table livraison_import;

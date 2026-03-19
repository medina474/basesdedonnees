\c cocagne;

create view gpao_produits as
select  produit_id, produit, sum(qte)
from distribution
group by produit_id, produit;

create view gpao_itineraire as
select ordre1, tournee_id, depot_id, lieu, ordre2, count(qte)
from distribution
group by ordre1, tournee_id, depot_id, lieu, ordre2 order by ordre1, ordre2;


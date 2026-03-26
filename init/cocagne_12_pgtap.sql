\c cocagne;

create extension if not exists pgtap schema tests;

create or replace function tests.test_has_table()
returns setof text
language plpgsql
as $function$
begin
  return next has_table( 'saison' );
  return next has_table( 'fermeture' );
  return next has_table( 'ferie' );
  return next has_table( 'adherent' );
  return next has_table( 'depot' );
  return next has_table( 'panier' );
  return next has_table( 'produit' );
end;
$function$;

-- lives_ok() garantit qu'une instruction SQL ne lève pas d'exception.

create or replace function tests.test_fermeture_semaine()
returns setof text
language plpgsql
as $function$
begin

  -- cas valide : semaine 1
  return next lives_ok(
    $$insert into fermeture (saison_id, semaine) values (2026, 2);$$,
    'semaine 2 doit être acceptée'
  );

  -- cas valide : semaine 52
  return next lives_ok(
    $$insert into fermeture (saison_id, semaine) values (2026, 48);$$,
    'semaine 48 doit être acceptée'
  );

  -- cas invalide : semaine 60
  return next throws_ok(
    $$insert into fermeture (saison_id, semaine) values (2026, 60);$$,
    '23514',
    'la nouvelle ligne de la relation « fermeture » viole la contrainte de vérification « fermeture_semaine_check »'
  );

  -- cas invalide : semaine 0
  return next throws_ok(
    $$insert into fermeture (saison_id, semaine) values (2026, 0);$$,
    '23514',
    'la nouvelle ligne de la relation « fermeture » viole la contrainte de vérification « fermeture_semaine_check »'
  );

  -- cas invalide : semaine négative
  return next throws_ok(
    $$insert into fermeture (saison_id, semaine) values (2026, -2);$$,
    '23514',
    'la nouvelle ligne de la relation « fermeture » viole la contrainte de vérification « fermeture_semaine_check »'
  );

end;
$function$;

create or replace function tests.test_ferie_within_saison()
returns setof text
language plpgsql
as $function$
begin

  -- cas valide
  return next lives_ok(
    $$insert into ferie (saison_id, ferie, jour) values (2026, 'Jour férié appartient à la saison', '2026-01-10');$$,
    'le jour appartient à la saison'
  );

  -- cas invalides
  return next throws_ok(
    $$insert into ferie (saison_id, ferie, jour) values (2026, 'Jour férié en dehors de la saison', '2027-01-10');$$,
    'P0001',
    'Le jour férié (2027-01-10) est en dehors de la saison ([2026-01-01,2027-01-01))'
  );

  return next throws_ok(
    $$insert into ferie (saison_id, ferie, jour) values (1999,'Saison inconnue','2026-09-01');$$,
    'P0001', 'La saison avec id 1999 est introuvable.'
  );

end;
$function$;

-- ----------
-- pgTAP va automatiquement chercher toutes les fonctions du schéma passé en paramètre
-- dont le nom commence par test_ et qui retournent SETOF TEXT.
-- Chaque fonction correspond à un groupe de tests.

set search_path = public,extensions,tests;

select * from runtests('tests'::name);

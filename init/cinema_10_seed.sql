\c cinema;

select 'Copying data into votes';
copy votes (film_id, votants, moyenne)
from '/tmp/cinema/060-votes.csv' delimiter ',' csv header quote '"' escape '''' encoding 'utf8';

select 'Copying data into quizzes';
copy quizzes
from '/tmp/cinema/070-quizzes.csv' delimiter ',' csv header quote '''' escape '\' encoding 'utf8';

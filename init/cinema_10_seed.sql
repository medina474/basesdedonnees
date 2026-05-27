\c cinema;
\pset tuples_only on


select 'Copying data into quizzes';
copy quizzes
from '/tmp/cinema/070-quizzes.csv' delimiter ',' csv header quote '''' escape '\' encoding 'utf8';

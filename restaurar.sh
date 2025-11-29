PGPASSWORD=123456 dropdb -h localhost -p 5432 -U postgres demobd
PGPASSWORD=123456 createdb -h localhost -p 5432 -U postgres demobd
PGPASSWORD=123456 psql -h localhost -p 5432 -U postgres -d demobd -f tablas.sql
PGPASSWORD=123456 psql -h localhost -p 5432 -U postgres -d demobd -f datos.sql

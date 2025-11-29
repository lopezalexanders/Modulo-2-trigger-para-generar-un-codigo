@echo off set PGPASSWORD=123456

REM Elimina la base de datos 
dropdb.exe -h localhost -p 5432 -U postgres demodb

REM Crea la base de datos 
createdb.exe -h localhost -p 5432 -U postgres demodb

REM Ejecuta tablas.sql
psql.exe -h localhost -p 5432 -U postgres -d demodb -f tablas.sql

REM Ejecuta datos.sql
psql.exe -h localhost -p 5432 -U postgres -d demodb -f datos.sql

echo. echo Restauración finalizada. 
pause

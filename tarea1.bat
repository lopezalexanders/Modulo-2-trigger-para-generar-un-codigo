@echo off set PGPASSWORD=123456

REM Elimina la base de datos 
dropdb.exe -h localhost -p 5432 -U postgres tarea1db

REM Crea la base de datos 
createdb.exe -h localhost -p 5432 -U postgres tarea1db

REM Ejecuta tablas.sql
psql.exe -h localhost -p 5432 -U postgres -d tarea1db -f tablas_tarea1.sql

REM Ejecuta datos.sql
psql.exe -h localhost -p 5432 -U postgres -d tarea1db -f datos_tarea1.sql

echo. echo Restauración finalizada. 
pause

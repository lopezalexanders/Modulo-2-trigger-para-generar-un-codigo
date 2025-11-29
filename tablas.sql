drop schema if exists public cascade;
create schema public;

create table persona(
    id serial primary key,
    paterno varchar default '',
    materno varchar default '',
    nombres varchar default '',
    fechanacimiento date default now(),
    direccion varchar default '',
    telefono integer default 7777777
);

create table estudiante(
    id serial primary key,
    persona_id integer,
    planestudio varchar default '',
    foreign key (persona_id) references persona(id)
);

create table bitacora(
    id serial primary key,
    tabla varchar default '',
    operacion varchar default '',
    datos jsonb,
    fecha timestamp default now()
);

--trigger
create or replace function bitacora_trigger() returns trigger as $$
begin
    insert into bitacora(tabla, operacion, datos) values
    (tg_table_name, tg_op, row_to_json(new));
    return new;
end;
$$ language plpgsql;

create trigger personas_bicatora_trigger
after insert or update on persona
for each row
execute function bitacora_trigger();

--funciones
create or replace function contarfilas() returns integer as $$
declare
    _resultado record;
    _cantidad integer;
begin
    _cantidad = 0;
    for _resultado in
        select * from persona
    loop
        _cantidad = _cantidad +1;
    end loop;
    return _cantidad;
end;
$$ language plpgsql;

create or replace view personaestudiante as
select paterno, materno, nombres, planestudio
from persona pe join estudiante est on pe.id=est.persona_id;


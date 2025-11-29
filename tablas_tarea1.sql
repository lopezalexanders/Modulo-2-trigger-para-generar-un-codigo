drop schema if exists public cascade;
create schema public;

-- crear tabla activofijo
create table activofijo (
id serial not null primary key,
codigovsiaf varchar not null,
fechaincorporacion date not null default now(),
descripcion varchar not null default '',
observaciones varchar default '',
costoinicial numeric(15,2) default 0,
habilitado boolean default true,
idauxiliar integer
);

--crear tabla auxiliar para almacerenar los tipos de activos fijos
-- ejemplo: edificaciones, muebles y enseres, maquinaria y equipo, etc.
create table auxiliar(
    id serial not null primary key,
    activofijo_id varchar not null,
    descripcion varchar default ''
);

-- ******* ----
-- Crear la función trigger que genera el código de activo fijo
CREATE OR REPLACE FUNCTION generar_codigo_activo()
RETURNS TRIGGER AS $$
DECLARE
    nuevo_codigo VARCHAR;
    codigo_vsiaf VARCHAR;
    cantidad INTEGER := 0;
    _resultado RECORD;

BEGIN
    -- Obtener el codigo de activo fijo de la tabla auxiliar
    SELECT activofijo_id INTO nuevo_codigo FROM auxiliar WHERE id = NEW.idauxiliar;

    -- Verificar si se encontró el código
    IF nuevo_codigo IS NULL THEN
            RAISE EXCEPTION 'El código de activo fijo (%) no existe.', NEW.idauxiliar;
        END IF;

    -- Contar la cantidad de activos con el mismo idauxiliar
    FOR _resultado IN
            SELECT * FROM activofijo WHERE idauxiliar = NEW.idauxiliar
    LOOP
            cantidad = cantidad +1;
    END LOOP;

    codigo_vsiaf := 'UNIOR -' || nuevo_codigo || '-' || LPAD((cantidad + 1)::TEXT, 4, '0');

    -- Asignar el código generado al nuevo registro
    NEW.codigovsiaf := codigo_vsiaf;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ******* ----
-- Crear el trigger que se dispara ANTES de la inserción
CREATE TRIGGER trg_activos_before_insert
BEFORE INSERT ON activofijo
FOR EACH ROW
EXECUTE FUNCTION generar_codigo_activo();
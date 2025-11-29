insert into auxiliar(activofijo_id, descripcion) 
values ('01', 'EDIFICACIONES'),
       ('02', 'MUEBLES Y ENSERES'),
       ('03', 'MAQUINARIA Y EQUIPO'),
       ('05', 'EQUIPO DE COMUNICACIONES'),
       ('08', 'VEHICULOS AUTOMOTORES'),
       ('13', 'HERRAMIENTAS EN GENERAL'),
       ('15', 'EQUIPOS DE COMPUTACION'),
       ('21', 'GALPONES'),
       ('34', 'TERRENOS'),
       ('36', 'OTROS ACTIVOSGARRAFAS'),
       ('38', 'EQUIPOS E INSTALACIONES');


insert into activofijo(codigovsiaf, descripcion, observaciones, costoinicial, idauxiliar)
values ('', 'OFICINA PRINCIPAL', 'OFICINA CENTRAL EN LA CIUDAD', 0, 1),
       ('', 'ESCRITORIO', 'ESCRITORIO EJECUTIVO', 0, 2),
       ('', 'ESCRITORIO', 'SILLON EJECUTIVO', 0, 2),
       ('', 'IMPRESORA LASER', 'IMPRESORA DE ALTA VELOCIDAD', 0, 7),
       ('', 'LAPTOP', 'LAPTOP PARA GERENTE', 0, 7);
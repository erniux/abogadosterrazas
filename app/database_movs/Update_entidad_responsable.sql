UPDATE expedientes SET entidad_responsable_id = 3 WHERE entidad_responsable = 'JUNTA FEDERAL';
UPDATE expedientes SET entidad_responsable_id = 2 WHERE entidad_responsable = 'JUNTA LOCAL';
UPDATE expedientes SET entidad_responsable_id = 2 WHERE entidad_responsable = 'Junta Local';
UPDATE expedientes SET entidad_responsable_id = 1 WHERE entidad_responsable = 'BUROCRÁTICO';
UPDATE expedientes SET entidad_responsable_id = 1 WHERE entidad_responsable = 'Burocrático';
UPDATE expedientes SET entidad_responsable_id = 1 WHERE entidad_responsable = 'Junta Federal';


UPDATE audiencia_expedientes SET estatus_audiencia_id = 1 WHERE estatus = 'PENDIENTE'; 
UPDATE audiencia_expedientes SET estatus_audiencia_id = 2 WHERE estatus = 'FALTA NOTIFICACIÓN'; 
UPDATE audiencia_expedientes SET estatus_audiencia_id = 3 WHERE estatus = 'DIFERIDA POR PLÁTICAS'; 
UPDATE audiencia_expedientes SET estatus_audiencia_id = 4 WHERE estatus = 'NO LLEGÓ EL EXHORTO'; 
UPDATE audiencia_expedientes SET estatus_audiencia_id = 5 WHERE estatus = 'POR INCIDENTE'; 
UPDATE audiencia_expedientes SET estatus_audiencia_id = 6 WHERE estatus = 'DESAHOGO Y PENDIENTE DE PRUEBAS'; 



INSERT INTO  estatus_audiencias ( "id", "estatus", "created_at", "updated_at") 
VALUES 
( 1, 'Pendiente', '2019-09-16 17:28:42.166647', '2019-09-16 17:28:42.166647' ),
( 2, 'Falta Notificación', '2019-09-16 17:28:42.166647', '2019-09-16 17:28:42.166647' ),
( 3, 'Diferida por Pláticas', '2019-09-16 17:28:42.166647', '2019-09-16 17:28:42.166647' ),
( 4, 'No llegó el exhorto', '2019-09-16 17:28:42.166647', '2019-09-16 17:28:42.166647' ),
( 5, 'Por Incidente', '2019-09-16 17:28:42.166647', '2019-09-16 17:28:42.166647' ),
( 6, 'Desahogo y pendiente de pruebas', '2019-09-16 17:28:42.166647', '2019-09-16 17:28:42.166647' ),
( 7, 'Se desahogo 2ra etapa', '2019-09-16 17:28:42.166647', '2019-09-16 17:28:42.166647' ),
( 8, 'Se desahogo 1ra etapa', '2019-09-16 17:28:42.166647', '2019-09-16 17:28:42.166647' );

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
  SELECT expedientes.expediente, expedientes.demandante, expedientes.demandado, entidad_responsables.nombre,  
resumen_links.fecha_publicacion, resumen_links.comentarios, accion_instancia.accion, 
resumen_expedientes.comentarios, resumen_expedientes.fecha_notificacion, estatus_procesals.estatus
FROM resumen_links, 
     resumen_expedientes, 
     expedientes, 
     accion_instancia, 
     estatus_procesals, 
     entidad_responsables  
WHERE resumen_links.expediente_id = resumen_expedientes.expediente_id
  AND resumen_links.expediente_id = expedientes.id
  AND resumen_expedientes.expediente_id = expedientes.id
  AND resumen_links.accion_instancium_id = accion_instancia.id
  AND resumen_expedientes.estatus_procesal_id = estatus_procesals.id
  AND expedientes.entidad_responsable_id = entidad_responsables.id
ORDER BY expedientes.estatus_procesal_id) ;



SELECT expedientes.expediente, expedientes.entidad_responsable_id FROM expedientes WHERE expedientes.expediente NOT IN (
SELECT expedientes.expediente
FROM resumen_links, 
     resumen_expedientes, 
     expedientes, 
     accion_instancia, 
     estatus_procesals, 
     entidad_responsables  
WHERE resumen_links.expediente_id = resumen_expedientes.expediente_id
  AND resumen_links.expediente_id = expedientes.id
  AND resumen_expedientes.expediente_id = expedientes.id
  AND resumen_links.accion_instancium_id = accion_instancia.id
  AND resumen_expedientes.estatus_procesal_id = estatus_procesals.id
  AND expedientes.entidad_responsable_id = entidad_responsables.id
ORDER BY expedientes.estatus_procesal_id) AND entidad_responsable_id <> 3; 
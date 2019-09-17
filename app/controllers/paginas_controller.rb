class PaginasController < ApplicationController
  def inicio
  	@inicio_semana = Date.today
  	@fin_semana = @inicio_semana + 7.days
  	rango_fechas = @inicio_semana..@fin_semana
  	if params[:entidad_responsable_id] && !params[:entidad_responsable_id].empty? 
  		@audiencias = AudienciaExpediente.find_by_sql("SELECT * FROM audiencia_expedientes a, expedientes e 
  										  WHERE a.fecha > '#{@inicio_semana}' and a.fecha < '#{@fin_semana}' 
  										  AND a.expediente_id = e.id 
  										  AND e.entidad_responsable_id = #{params[:entidad_responsable_id]}
  										  ORDER BY a.fecha ASC") 
  	else
  		@audiencias = AudienciaExpediente.where('fecha >= ? and fecha < ?', @inicio_semana, @fin_semana)
  										 .order("fecha ASC") 
  	end	

  end 

end


 
class PaginasController < ApplicationController
  def inicio
  	@inicio_semana = Date.yesterday
  	@fin_semana = @inicio_semana + 7.days
  	
  	 
  	@audiencias= AudienciaExpediente.where('fecha >= ? and fecha < ?', @inicio_semana, @fin_semana)
  end

  def catalogos
  end
end

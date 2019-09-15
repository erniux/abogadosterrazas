class PaginasController < ApplicationController
  def inicio
  	@inicio_semana = Date.today
  	@fin_semana = @inicio_semana + 7.days
  	@audiencias = AudienciaExpediente.where('fecha >= ? and fecha < ?', @inicio_semana, @fin_semana).order("fecha ASC").page(params[:page]) 
  end 

  def años
  end

  def entidades
  end

  def abogados
  end

end

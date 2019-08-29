class PaginasController < ApplicationController
  def inicio
  	@inicio_semana = Date.yesterday
  	@fin_semana = @inicio_semana + 7.days
  	@audiencias = AudienciaExpediente.where('fecha >= ? and fecha < ?', @inicio_semana, @fin_semana).order("fecha ASC").page(params[:page]).per(10)
  end

  def catalogos
  end

  def años
  end

  def entidades
  end

  def abogados
  end

end

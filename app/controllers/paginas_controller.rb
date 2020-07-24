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
    AuditLog.create!(current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Menú Inicio' )

  end 

  def consulta
	@expedientes = Expediente.all.order("entidad_responsable_id DESC, anio ASC, expediente ASC").page(params[:page])
  AuditLog.create!(current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Menú Consulta' )
  end

  ##def estadistica
  ##  puts "Start: #{params[:start]}"
  ##  puts "End: #{params[:end]}"

##    @start_date = params[:start].try(:to_date) || 30.days.ago.to_date
##    @end_date = params[:end].try(:to_date) || Date.current
##    rango = (@start_date..@end_date)
##    @expedientes_todos = Expediente.all
##    @expedientes =   Expediente.group_by_week(:updated_at).count 
##    @expedientes_nvos = Expediente.where(created_at: rango).order(created_at: :desc)
##    @expedientes_acts = Expediente.where(updated_at: rango).order(created_at: :desc)
##     
##
##    @expedientes_nuevos = EntidadResponsable.ids.map do |entidad| 
##      { name: EntidadResponsable.where(id: entidad).group(:id).first.nombre, data: group_by_period(Expediente.where(entidad_responsable_id: entidad), rango, :created_at).count}
##    end
##
##    @expedientes_actualizados = EntidadResponsable.ids.map do |entidad| 
##      { name: EntidadResponsable.where(id: entidad).group(:id).first.nombre, data: group_by_period(Expediente.where(entidad_responsable_id: entidad), rango, :updated_at).count}
##    end
##  end
##
##  private
##    def group_by_period(data, range, date)
##      diff = @end_date -  @start_date
##
##      if diff < 31
##        data.group_by_day(date, range: range)
##      elsif diff < 91
##        data.group_by_week(date, range: range)
##      else
##        data.group_by_month(date, range: range)
##
##      end
##
##    end


end


 
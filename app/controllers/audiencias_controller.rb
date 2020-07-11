class AudienciasController < ApplicationController
  access admin: :all
  
	def index
		@audiencias = AudienciaExpediente.all 
    @vacaciones = Holiday.all
    AuditLog.create!(current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Menú Audiencias' )
	end

	private
    def set_audiencia
      @audiencia = AudienciaExpediente.find(params[:id])
    end

    def audiencia_params
      params.require(:audiencia_expediente).permit(:fecha, :asignado, :comentario, :expediente_id, :estatus_audiencia_id, :fecha_fin)
    end
end

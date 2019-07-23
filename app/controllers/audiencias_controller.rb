class AudienciasController < ApplicationController
  access admin: :all
  
	def index
		@audiencias = AudienciaExpediente.all 

	end

	private
    def set_audiencia
      @audiencia = AudienciaExpediente.find(params[:id])
    end

    def audiencia_params
      params.require(:audiencia_expediente).permit(:fecha, :asignado, :comentario, :expediente_id)
    end
end

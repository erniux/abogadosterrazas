class AudienciasController < ApplicationController
  access abogado: {except: [:destroy]}, admin: :all
  
	def index
		@audiencias = AudienciaExpediente.where(expediente_id: params[:expediente_id])
	end


	private
    def set_audiencia
      @audiencia = AudienciaExpediente.find(params[:id])
    end

    def audiencia_params
      params.require(:audiencia_expediente).permit(:fecha, :asignado, :comentario, :expediente_id)
    end
end

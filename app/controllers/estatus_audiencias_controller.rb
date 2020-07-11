class EstatusAudienciasController < ApplicationController
	before_action :set_estatus_audiencia, only: [:edit, :update, :destroy]
	access admin: :all

	def index
		@estatus_audiencias = EstatusAudiencia.all
    AuditLog.create!(current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Menú estatus audiencias' )
	end

	def new
		@estatus_audiencia = EstatusAudiencia.new
	end

	def edit

	end

	def create
    	@estatus_audiencia = EstatusAudiencia.new(estatus_audiencia_params)

    	respond_to do |format|

      		if @estatus_audiencia.save
        		format.html { redirect_to estatus_audiencias_path, notice: 'Regsitro creado correctamente.' }
      		else
        		format.html { render :new }
      		end
    	end
  	end

  	def update
  	  respond_to do |format|
  	    if @estatus_audiencia.update(estatus_audiencia_params)
  	      format.html { redirect_to  estatus_audiencias_path, notice: 'Regsitro actualizado correctamente.' }
  	    else
  	      format.html { render :edit }
  	    end
  	  end
  	end

  	def destroy
  	  if @estatus_audiencia.destroyed?
  	  respond_to do |format|
  	    format.html { redirect_to estatus_audiencias_path, notice: 'Regsitro eliminado correctamente.' }
  	  end
  	else
  		respond_to do |format|
  	    format.html { redirect_to estatus_audiencias_path, alert: 'No es Posible eliminar el Estatus, existen Audiencias con el estatus seleccionado.' }
  	  end
  	end
  	end

  	private
    
    def set_estatus_audiencia
      @estatus_audiencia = EstatusAudiencia.find(params[:id])
    end

    def estatus_audiencia_params
      params.require(:estatus_audiencia).permit(:id, :estatus)
    end

end
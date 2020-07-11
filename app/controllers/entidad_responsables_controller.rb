class EntidadResponsablesController < ApplicationController
	before_action :set_entidad_responsable, only: [:edit, :update, :destroy]
	access admin: :all

	def index
		@entidad_responsables = EntidadResponsable.all
    AuditLog.create!(current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Menú Entidad Responsable' )
	end

	def new
		@entidad_responsable = EntidadResponsable.new
	end

	def edit

	end

	def create
    	@entidad_responsable = EntidadResponsable.new(entidad_responsable_params)

    	respond_to do |format|

      		if @entidad_responsable.save
        		format.html { redirect_to entidad_responsables_path, notice: 'Regsitro creado correctamente.' }
      		else
        		format.html { render :new }
      		end
    	end
  	end

  	def update
  	  respond_to do |format|
  	    if @entidad_responsable.update(entidad_responsable_params)
  	      format.html { redirect_to  entidad_responsables_path, notice: 'Regsitro actualizado correctamente.' }
  	    else
  	      format.html { render :edit }
  	    end
  	  end
  	end

  	def destroy
  	  if @entidad_responsable.destroyed?
  	  respond_to do |format|
  	    format.html { redirect_to entidad_responsables_path, notice: 'Regsitro eliminado correctamente.' }
  	  end
  	else
  		respond_to do |format|
  	    format.html { redirect_to entidad_responsables_path, alert: 'No es Posible eliminar el Estatus, existen Audiencias con el estatus seleccionado.' }
  	  end
  	end
  	end

  	private
    
    def set_entidad_responsable
      @entidad_responsable = EntidadResponsable.find(params[:id])
    end

    def entidad_responsable_params
      params.require(:entidad_responsable).permit(:id, :nombre)
    end

end
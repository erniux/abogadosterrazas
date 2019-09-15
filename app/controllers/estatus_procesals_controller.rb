class EstatusProcesalsController < ApplicationController
	before_action :set_estatus_procesal, only: [:edit, :update, :destroy]
	access admin: :all

	def index
		@estatus_procesals = EstatusProcesal.all
	end

	def new
		@estatus_procesal = EstatusProcesal.new
	end

	def edit

	end

	def create
    	@estatus_procesal = EstatusProcesal.new(estatus_procesal_params)

    	respond_to do |format|

      		if @estatus_procesal.save
        		format.html { redirect_to estatus_procesals_path, notice: 'Regsitro creado correctamente.' }
      		else
        		format.html { render :new }
      		end
    	end
  	end

  	def update
  	  respond_to do |format|
  	    if @estatus_procesal.update(estatus_procesal_params)
  	      format.html { redirect_to @estatus_procesal, notice: 'Regsitro actualizado correctamente.' }
  	    else
  	      format.html { render :edit }
  	    end
  	  end
  	end

  	def destroy
  	  @estatus_procesal.destroy
  	  respond_to do |format|
  	    format.html { redirect_to estatus_procesals_path, notice: 'Regsitro eliminado correctamente.' }
  	  end
  	end

  	private
    
    def set_estatus_procesal
      @estatus_procesal = EstatusProcesal.find(params[:id])
    end

    def estatus_procesal_params
      params.require(:estatus_procesal).permit(:id, :estatus)
    end

end
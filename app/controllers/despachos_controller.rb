class DespachosController < ApplicationController
	before_action :set_despacho, only: [:edit, :update, :destroy]
  access admin: :all

  def index
    @despachos = Despacho.all
  end

  def new
    @despacho = Despacho.new
  end

  def edit

  end

  def create
      @despacho = Despacho.new(despacho_params)
      respond_to do |format|
          if @despacho.save
            format.html { redirect_to despachos_path, notice: 'Regsitro creado correctamente.' }
          else
            format.html { render :new }
          end
      end
    end

    def update
      respond_to do |format|
        if @despacho.update(despacho_params)
          format.html { redirect_to  despachos_path, notice: 'Regsitro actualizado correctamente.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      if @despacho.destroyed?
      respond_to do |format|
        format.html { redirect_to despachos_path, notice: 'Regsitro eliminado correctamente.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to despachos_path, alert: 'Favor de intentar mas tarde.' }
      end
    end
    end

    private
    
    def set_despacho
      @despacho = Despacho.find(params[:id])
    end

    def despacho_params
      params.require(:despacho).permit(:id, :colonia, :calle, :numero, :abogado_id,
                         locations_attributes: [:id, :archivero, :cajon, :alias, :despacho_id, :_destroy])
    end

end
class DespachosController < ApplicationController
	before_action :set_despacho, only: [:show, :edit, :update, :destroy]
  access abogado: {except: [:destroy]}, admin: :all

  def index
    #@despachos = Despaho.all.order("anio DESC")
    if params[:term]
      @despachos = Despacho.search_by_full_despacho(params[:term]).page(params[:page])
    elsif params[:term].blank?
      @despachos = Despacho.all.order(updated_at: 'DESC', colonia: 'DESC').page(params[:page]) 
    end 

  end

  def show
     
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
        #Crear Registro en la bitácora
        format.html { redirect_to despachos_path, notice: 'Registro creado correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @despacho.update(despacho_params)
        format.html { redirect_to despachos_path, notice: 'Registro actualizado correctamente.' }
      end
    end
  end

  def destroy
    @despacho.destroy
    respond_to do |format|
      format.html { redirect_to despachos_urkl, notice: 'Registro eliminado correctamente.' }
    end
  end

  private
    def set_despacho
      @despacho = Despacho.find(params[:id])
    end

    def despacho_params
      params.require(:despacho).permit(:colonia, :calle, :numero, :abogado_id,
                         locations_attributes: [:id, :archivero, :cajon, :despacho_id, :alias, :_destroy])
    end

end
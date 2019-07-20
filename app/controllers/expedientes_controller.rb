class ExpedientesController < ApplicationController
	before_action :set_expediente, only: [:show, :edit, :update, :destroy]

  def index
    #@expedientes = Expediente.all.order("anio DESC")
    if params[:term]
      @expedientes = Expediente.search_by_full_expediente(params[:term]) #.page(params[:page]).per(15).padding(4)
    else
      @expedientes = Expediente.all.page(params[:page]).per(15).padding(4)
    end

  end

  def show
  end

  def new
    @expediente = Expediente.new
  end

  def edit
  end

  def create
    @expediente = Expediente.new(expediente_params) 

    respond_to do |format|
      if @expediente.save
        #Crear Registro en la bitácora
         
        format.html { redirect_to @expediente, notice: 'Regsitro creado correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @expediente.update(expediente_params)
        format.html { redirect_to @expediente, notice: 'Regsitro actualizado correctamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @expediente.destroy
    respond_to do |format|
      format.html { redirect_to expedientes_url, notice: 'Regsitro eliminado correctamente.' }
    end
  end

  private
    def set_expediente
      @expediente = Expediente.find(params[:id])
    end

    def expediente_params
      params.require(:expediente).permit(:anio, :expediente, :demandante, :demandado, :entidad_responsable, :socio, 
                                         :estado_procesal, :ubicacion_fisica, :despacho, :referencia1, :referencia2, 
                                         :referencia3, :comentarios, :archivo,
                         audiencia_expedientes_attributes: [:id, :fecha, :asignado, :comentarios, :expedientes_id, :estatus,
                                                            :_destroy])
    end

end
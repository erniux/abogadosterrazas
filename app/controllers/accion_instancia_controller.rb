class AccionInstanciaController < ApplicationController
    before_action :set_accion_instancium, only: [:show, :edit, :update, :destroy]
   
def index     
    @acciones = AccionInstancium.all
end

def show
end

def new
    @accion = AccionInstancium.new
end

def edit
end
   
def create
    @accion = AccionInstancium.new(accion_params)

    respond_to do |format|
      if @accion.save
        format.html { redirect_to accion_instancia_path, notice: 'Registro creado con éxito.' }
      else
        format.html { render :new }
      end
    end
end
   
def update
    respond_to do |format|
      if @accion.update(accion_params)
        format.html { redirect_to accion_instancia_path, notice: 'Registro actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @accion }
      else
        format.html { render :edit }
        format.json { render json: @accion.errors, status: :unprocessable_entity }
      end
    end
  end

   
  def destroy
    @accion.destroy
    respond_to do |format|
      format.html { redirect_to accion_instancia_path, notice: 'Registro eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    def set_accion_instancium
      @accion = AccionInstancium.find(params[:id])
    end

     
    def accion_params
      params.require(:accion_instancium).permit(:accion)
    end

 
end
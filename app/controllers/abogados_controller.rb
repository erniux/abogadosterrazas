class AbogadosController < ApplicationController
        before_action :set_abogado, only: [:show, :edit, :update, :destroy]
       
    def index     
        @abogados = Abogado.all
        AuditLog.create!(current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Menú Abogados' )
    end
    
    def show
    end
    
    def new
        @abogado = Abogado.new
    end
    
    def edit
    end
       
    def create
        @abogado = Abogado.new(abogado_params)
    
        respond_to do |format|
          if @abogado.save
            format.html { redirect_to abogados_path, notice: 'Registro creado con éxito.' }
          else
            format.html { render :new }
          end
        end
    end
       
    def update
        respond_to do |format|
          if @abogado.update(abogado_params)
            format.html { redirect_to abogados_path, notice: 'Registro actualizado con éxito.' }
            format.json { render :show, status: :ok, location: @abogado }
          else
            format.html { render :edit }
            format.json { render json: @abogado.errors, status: :unprocessable_entity }
          end
        end
      end
    
       
      def destroy
        @abogado.destroy
        respond_to do |format|
          format.html { redirect_to abogados_path, notice: 'Registro eliminado con éxito.' }
          format.json { head :no_content }
        end
      end
    
      private
        def set_abogado
          @abogado = Abogado.find(params[:id])
        end
    
         
        def abogado_params
          params.require(:abogado).permit(:nombre, :iniciales)
        end
    
     
end

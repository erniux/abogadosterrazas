class CuestionariosController < ApplicationController
	before_action :set_cuestionario, only: [:edit, :update, :destroy]
	access admin: :all

	def index
		@cuestionarios = Cuestionario.all
	end

	def index
		if params[:term]
		  @cuestionarios = Cuestionario.search_by_full_cuestionario(params[:term]).page(params[:page])
		elsif params[:term].blank?
		  @cuestionarios = Cuestionario.all.order(nombre: 'ASC').page(params[:page]) 
		end 
	
	  end

	def new
		@cuestionario = Cuestionario.new
	end

	def edit

	end

	def create
    	@cuestionario = Cuestionario.new(cuestionario_params)

    	respond_to do |format|

      		if @cuestionario.save
        		format.html { redirect_to cuestionarios_path, notice: 'Regsitro creado correctamente.' }
      		else
        		format.html { render :new }
      		end
    	end
  	end

  	def update
  	  respond_to do |format|
  	    if @cuestionario.update(cuestionario_params)
  	      format.html { redirect_to  cuestionarios_path, notice: 'Regsitro actualizado correctamente.' }
  	    else
  	      format.html { render :edit }
  	    end
  	  end
  	end

  	def destroy
  	  if @cuestionario.destroyed?
  	  respond_to do |format|
  	    format.html { redirect_to cuestionarios_path, notice: 'Regsitro eliminado correctamente.' }
  	  end
  	else
  		respond_to do |format|
  	    format.html { redirect_to cuestionarios_path, alert: 'No es Posible eliminar el Cuestionario.' }
  	  end
  	end
  	end

  	private
    
    def set_cuestionario
      @cuestionario = Cuestionario.find(params[:id])
    end

    def cuestionario_params
	  params.require(:cuestionario).permit(:id, :nombre, :appaterno, :apmaterno, :calle, :numero, :colonia, :municipio, :estado, :pais, 
										   :codigo_postal, :correo_electronico, :nombre_contratante, :puesto_contratante, 
										   :nombre_jefe_directo, :puesto_jefe_directo, :puesto, :funciones, :lugar_contratacion, 
										   :calle_contratacion, :numero_contratacion, :colonia_contratacion, :municipio_contratacion, 
										   :estado_contrtacion, :pais_contratacion, :codigo_postal_contratacion, :actividad_laboral, 
										   :horario_trabajo, :dias_trabajo, :salario_contratacion, :frecuencia_pago, :esquema_contratacion, 
										   :prestaciones, :forma_pago_salario, :fecha_ingreso_laboral, :fecha_separacion_laboral, 
										   :hora_separacion_laboral, :nombre_responsable_despido, :puesto_responsable_despido, 
										   :lugar_despido, :manifiesto_despido, :adeudos_laborales, :numero_imss, :imss_prestacion, 
										   :credito_infonavit, :infonavit_prestacion, :afore_prestacion, :afore_nombre, 
										   :accidentes_de_trabajo, :accidentes_detalle, :adeudo_vacaciones_dias, :adeudo_vacaciones_monto, 
										   :adeudo_vacaciones_anios, :adeudo_prima_vacacional_dias, :adeudo_prima_vacacional_monto, 
										   :adeudo_prima_vacacional_anios, :adeudo_aguinaldo_dias, :adeudo_aguinaldo_monto, 
										   :adeudo_aguinaldo_anios, :adeudo_tiempo_extra_dias, :adeudo_tiempo_extra_monto, 
										   :adeudo_tiempo_extra_anios, :empresa, :condicion_salud, :otras_prestaciones_nombre_1, 
										   :otras_prestaciones_nombre_2, :otras_prestaciones_nombre_3, :otras_prestaciones_nombre_4, 
										   :otras_prestaciones_adeudo_1, :otras_prestaciones_adeudo_2, :otras_prestaciones_adeudo_3, 
										   :otras_prestaciones_adeudo_4, cuestionarios: [])
    end

end
class ExpedientesController < ApplicationController
	before_action :set_expediente, only: [:show, :edit, :update, :destroy]
  access abogado: {except: [:destroy]}, admin: :all

  def index
    
    if params[:term].present?
      @expedientes = Expediente.search_by_full_expediente(params[:term]).page(params[:page])
    elsif 
      @expedientes = Expediente.all.order(updated_at: 'DESC', expediente: 'DESC').page(params[:page]) 
    end 
    AuditLog.create!(current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Menú Expedientes', archivo: params[:term] )

  end

  def show
    AuditLog.create!(expediente: @expediente.expediente, demandante: @expediente.demandante, demandado: @expediente.demandado, 
      entidad_responsable: @expediente.entidad_responsable_id, socio: @expediente.socio, anio: @expediente.anio,  
      email: current_user.email, current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Consulta de Expediente' )
  end

  def new
    @expediente = Expediente.new

  end

  def edit
  end

  def create
    @expediente = current_user.expedientes.new(expediente_params)

    respond_to do |format|
      if @expediente.save
        #Crear Registro en la bitácora
        AuditLog.create!(expediente: @expediente.expediente, demandante: @expediente.demandante, demandado: @expediente.demandado, 
          entidad_responsable: @expediente.entidad_responsable_id, socio: @expediente.socio, anio: @expediente.anio,  
          email: current_user.email, current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Creación de Expediente' )
         
        format.html { redirect_to @expediente, notice: 'Registro creado correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @expediente.update(expediente_params)
        AuditLog.create!(expediente: @expediente.expediente, demandante: @expediente.demandante, demandado: @expediente.demandado, 
          entidad_responsable: @expediente.entidad_responsable_id, socio: @expediente.socio, anio: @expediente.anio,  
          email: current_user.email, current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Actualización de Expediente' )
        format.html { redirect_to @expediente, notice: 'Registro actualizado correctamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    AuditLog.create!(expediente: @expediente.expediente, demandante: @expediente.demandante, demandado: @expediente.demandado, 
  entidad_responsable: @expediente.entidad_responsable_id, socio: @expediente.socio, anio: @expediente.anio,  
  email: current_user.email, current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Eliminación de Expediente' )
    @expediente.destroy
    respond_to do |format|
      format.html { redirect_to expedientes_url, notice: 'Registro eliminado correctamente.' }
    end
  end

  def delete_upload_documentos
    @expediente=Expediente.find(params[:expediente_id])
    @expediente.documentos.find_by_id(params[:documentos_id]).purge
    redirect_back(fallback_location: request.referer)
  end


  def linea_tiempo 
      arr = []
      i = 0
      @expediente.audiencia_expedientes.each do |audiencia|
        arr[i] = [i, audiencia.fecha, audiencia.estatus_audiencia.estatus, 'audiencia']
        i = i + 1
      end
      
      @expediente.resumen_expedientes.each do |despacho| 
        arr[i] = [i, despacho.fecha_notificacion, despacho.estatus_procesal.estatus, 'despacho']  
        i = i + 1 
      end 

      @expediente.resumen_links.each do |instancia| 
        arr[i] = [i, instancia.fecha_publicacion, instancia.accion_instancium.accion, 'instancia']  
      i = i + 1 
      end 

      linea_tiempo = arr
    end

  private
    def set_expediente
      @expediente = Expediente.find(params[:id])
    end

    

    def expediente_params
      params.require(:expediente).permit(:anio, :expediente, :demandante, :demandado, :entidad_responsable, :socio, 
                                         :estado_procesal, :estatus_procesal_id, :entidad_responsable_id, :ubicacion_fisica, :despacho, :referencia1, :referencia2, 
                                         :referencia3, :comentarios, :recomendado, :en_sociedad, :archivo, :user_id, :cliente, :location, documentos: [],
                         audiencia_expedientes_attributes: [:id, :fecha, :asignado, :comentarios, :expedientes_id, :estatus, :estatus_audiencia_id, :fecha_fin, 
                                                            :citatorio, :_destroy], 
                         resumen_expedientes_attributes: [:id, :comentarios, :fecha_notificacion, :expediente_id, :estatus_procesal_id, :escrito, :_destroy ],
                         resumen_links_attributes: [:id, :fecha_publicacion, :comentarios, :expediente_id, :accion_instancium_id, :_destroy ]) 
    end

end

 
 
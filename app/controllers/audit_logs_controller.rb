class AuditLogsController < ApplicationController
  	access  admin: :all

	def index
    #@expedientes = Expediente.all.order("anio DESC")
    if params[:term]
      @bitacora = AuditLog.search_by_full_auditlog(params[:term]).order(created_at: 'DESC', expediente: 'DESC')
    elsif params[:term].blank?
      @bitacora = AuditLog.all.order(created_at: 'DESC', expediente: 'DESC') 
    end 

  end

end

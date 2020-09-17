class AuditLogsController < ApplicationController
  	access  admin: :all

	def index
    	if params[:term]
      		@bitacora = AuditLog.search_by_full_auditlog(params[:term]).order(created_at: 'DESC').page(params[:page])
    	elsif params[:term].blank?
      		@bitacora = AuditLog.where("Expediente IS NOT NULL").order(created_at: 'DESC', expediente: 'DESC').page(params[:page])  
    	end 
    	AuditLog.create!(current_sign_in_ip: current_user.current_sign_in_ip,  user_id: current_user.id, accion: 'Menú audit logs' )
	  end
	  
	  def create
		AuditLog.create!(archivo: params[:archivo],  accion: params[:accion], user_id: current_user.id) 
		    
	  end

	 
  	
end

 
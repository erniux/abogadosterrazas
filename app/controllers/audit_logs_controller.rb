class AuditLogsController < ApplicationController
  	access  admin: :all

	def index
    	if params[:term]
      		@bitacora = AuditLog.search_by_full_auditlog(params[:term]).order(created_at: 'DESC').page(params[:page])
    	elsif params[:term].blank?
      		@bitacora = AuditLog.all.order(created_at: 'DESC', expediente: 'DESC').page(params[:page])  
    	end 
  	end
  	
end
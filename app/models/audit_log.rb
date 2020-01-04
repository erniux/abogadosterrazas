class AuditLog < ApplicationRecord
	include PgSearch::Model

	belongs_to :user

	  pg_search_scope :search_by_full_auditlog, against: [:expediente, :entidad_responsable, :socio, 
	  	:estado_procesal, :ubicacion_fisica, :despacho, :referencia1, :referencia2, :referencia3, :comentarios, :archivo, :anio, 
	  	:fecha_audiencia, :asignado_audiencia, :comentarios_audicencia, :estatus, :accion], 
                        using:   {tsearch: { prefix: true }}

	def self.nombre_usuario(user_id)
		nombre = User.find(id: user_id)
	end	
	
	def audiencias(cadena)
		 return cadena.split(",")
		 

	end
end


 
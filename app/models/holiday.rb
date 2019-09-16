class Holiday < ApplicationRecord
	before_validation :rellena_campos

	def rellena_campos
		self.comentarios = self.expediente_id
		self.asignado = self.expediente_id
		self.estatus = 'vacaciones'
		 
	end
end

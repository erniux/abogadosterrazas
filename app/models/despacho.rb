class Despacho < ApplicationRecord
	has_many :locations, inverse_of: :despacho, dependent: :destroy 
	 

	accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true

	def abogado(id)
    	abogado = Abogado.where(id: id).first.nombre
    end 

end

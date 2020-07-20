class Despacho < ApplicationRecord
	has_many :locations, inverse_of: :despacho, dependent: :destroy 
	belongs_to :abogados

	accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true

	def abogado(id)
    	abogado = Abogado.where(id: id).first.nombre
    end 

end

class Expediente < ApplicationRecord
	include PgSearch::Model

	before_save :to_upper
	has_many :audiencia_expedientes, inverse_of: :expediente
	validates_uniqueness_of :expediente
	
	accepts_nested_attributes_for :audiencia_expedientes, reject_if: :all_blank, allow_destroy: true

	pg_search_scope :search_by_full_expediente, against: [:expediente, :demandante, :demandado, :entidad_responsable, 
														  :socio, :estado_procesal, :ubicacion_fisica, :despacho, 
														  :referencia1, :referencia2, :referencia3, :anio], 
												using: {tsearch: { prefix: true }
                  }

  private

  def to_upper
    attributes.keys.each do |attribute|
      [attribute].try(:upcase!)
    end
  end

end
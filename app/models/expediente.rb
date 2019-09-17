class Expediente < ApplicationRecord
	include PgSearch::Model

	before_save :to_upper
	belongs_to :user
	belongs_to :entidad_responsable
	has_many :audiencia_expedientes, inverse_of: :expediente 
	belongs_to :estatus_procesal
	
	
	validates_uniqueness_of :expediente
	validates_presence_of :anio, :expediente, :demandante, :demandado, :socio, :ubicacion_fisica, :despacho, :estatus_procesal_id
	
	accepts_nested_attributes_for :audiencia_expedientes, reject_if: :all_blank, allow_destroy: true

	pg_search_scope :search_by_full_expediente, against: [:expediente, :demandante, :demandado, :entidad_responsable, 
														  :socio, :estado_procesal, :ubicacion_fisica, :despacho, 
														  :referencia1, :referencia2, :referencia3, :anio], 
												using:   {tsearch: { prefix: true }}

	
	scope :expediente_por_anio, -> (anio) {where("anio= ?", anio)}

	scope :expediente_por_entidad, ->(entidad)	{ where("entidad_responsable= ?", entidad.to_s)}

  	private

  	def to_upper
  	  attributes.keys.each do |attribute|
  	    [attribute].try(:upcase!)
  	  end
  	end

  	def self.proximas_audiencias
  		inicio_semana = Date.today 
		fin_semana = inicio_semana + 7.days
		prox_audiencias = Expediente.find_by_sql("select t1.entidad_responsable_id, count(t1.entidad_responsable_id) 
												   from expedientes t1, audiencia_expedientes t2 
												   where  t2.expediente_id = t1.id and t2.fecha >= '#{inicio_semana}' 
												   and t2.fecha <= '#{fin_semana}' GROUP BY t1.entidad_responsable_id" )
 
  	end

end
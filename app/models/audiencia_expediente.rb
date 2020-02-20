class AudienciaExpediente < ApplicationRecord
  include PgSearch::Model

  validates_presence_of :fecha, :asignado, :comentarios, :estatus, :fecha_fin

  belongs_to :expediente
  belongs_to :estatus_audiencia
  has_one_attached :citatorio
  
  before_save :to_upper

  pg_search_scope :search_audiencia, against: [:fecha, :asignado], 
                        using:   {tsearch: { prefix: true }}

                         
  private

  def to_upper
    attributes.keys.each do |attribute|
      self[attribute].try(:upcase!)
    end
  end
 
 
end

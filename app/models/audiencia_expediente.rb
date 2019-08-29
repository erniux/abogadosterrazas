class AudienciaExpediente < ApplicationRecord
  include PgSearch::Model

  belongs_to :expediente
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

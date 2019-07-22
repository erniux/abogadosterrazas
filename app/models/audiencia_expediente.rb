class AudienciaExpediente < ApplicationRecord
  belongs_to :expediente

  before_save :to_upper


  private
  def to_upper
    attributes.keys.each do |attribute|
      self[attribute].try(:upcase!)
    end
  end

  #validates_presence_of :fecha
#
#  #validate :fecha_is_valid_datetime
#
#  #def fecha_is_valid_datetime
#  #	if fecha.nil?
#  #		errors.add(:fecha, 'Inválida')
#  #	elsif fecha < DateTime.now()
#  #  	errors.add(:fecha, 'Inválida')
#	# end
  #end

 
end

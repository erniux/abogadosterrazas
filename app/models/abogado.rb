class Abogado < ApplicationRecord
  validates_presence_of :nombre, :iniciales
 
  
  before_save :to_upper

  def to_upper
    attributes.keys.each do |attribute|
      self[attribute].try(:upcase!)
    end
  end
end

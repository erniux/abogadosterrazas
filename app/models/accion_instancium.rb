class AccionInstancium < ApplicationRecord
    validates_presence_of  :accion

    before_save :to_upper

  def to_upper
    attributes.keys.each do |attribute|
      self[attribute].try(:upcase!)
    end
  end

end

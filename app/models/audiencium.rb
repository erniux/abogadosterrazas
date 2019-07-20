class Audiencium < ApplicationRecord
  belongs_to :expediente

  before_save :to_upper


  private
  def to_upper
    attributes.keys.each do |attribute|
      self[attribute].try(:upcase!)
    end
  end
  
end

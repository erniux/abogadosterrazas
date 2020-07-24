class Location < ApplicationRecord
  belongs_to :despacho

    validates_presence_of :archivero, :cajon

     
    validates :alias, presence: true, uniqueness: {message: "no valido"}
end

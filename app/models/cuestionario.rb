class Cuestionario < ApplicationRecord
    include PgSearch::Model
    
    has_many_attached :cuestionarios

    before_save :to_upper

    validates_presence_of :nombre, :appaterno, :apmaterno

    pg_search_scope :search_by_full_cuestionario, against: [:nombre, :appaterno, :apmaterno, :empresa], 
                    using:   {tsearch: { prefix: true }}
     

    def to_upper
  	  attributes.keys.each do |attribute|
  	    [attribute].try(:upcase!)
  	  end
    end

end

 
 
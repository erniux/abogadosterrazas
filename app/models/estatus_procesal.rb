class EstatusProcesal < ApplicationRecord

	validates_uniqueness_of :estatus
	validates_presence_of :estatus

	 
	 
end

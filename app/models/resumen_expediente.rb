class ResumenExpediente < ApplicationRecord
  belongs_to :expediente
  belongs_to :estatus_procesal
end

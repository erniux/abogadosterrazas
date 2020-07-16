class AddReferenceToDespachos < ActiveRecord::Migration[6.0]
  def change
    add_reference :despachos, :abogado, null: false, foreign_key: true
  end
end

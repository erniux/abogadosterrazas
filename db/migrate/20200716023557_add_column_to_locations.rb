class AddColumnToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :alias, :string
  end
end

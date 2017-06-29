class AddMaxToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :max, :float
  end
end

class AddCoordinatesToFixers < ActiveRecord::Migration[7.0]
  def change
    add_column :fixers, :latitude, :float
    add_column :fixers, :longitude, :float
  end
end

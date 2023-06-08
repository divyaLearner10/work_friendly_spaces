class AddCoordinatesToRentingSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :renting_spaces, :latitude, :float
    add_column :renting_spaces, :longitude, :float
  end
end

class AddPriceToRentingSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :renting_spaces, :price, :integer
  end
end

class CreateRentingSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :renting_spaces do |t|
      t.string :name
      t.string :address
      t.string :amenities
      t.boolean :internet
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

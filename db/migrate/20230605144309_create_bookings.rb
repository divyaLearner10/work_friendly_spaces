class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :card_number
      t.string :cvc
      t.integer :number_of_guests
      t.references :users, null: false, foreign_key: true
      t.references :renting_spaces, null: false, foreign_key: true

      t.timestamps
    end
  end
end

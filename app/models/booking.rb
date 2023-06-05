class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :renting_spaces
end

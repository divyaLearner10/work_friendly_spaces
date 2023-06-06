class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :renting_space
end

class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def alpha_rides
    rides.order(:name)
  end
end

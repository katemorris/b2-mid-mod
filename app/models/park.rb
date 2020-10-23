class Park < ApplicationRecord
  has_many :rides

  def avg_thrill
    rides.average(:thrill_rating)
  end
end

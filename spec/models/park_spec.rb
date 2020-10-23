require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
  end

  describe 'instance methods' do
    it '.avg_thrill' do
      six_flags = Park.create(
        name: 'Six Flags',
        price: 35.50
      )
      nitro = Ride.create(
        name: 'Nitro',
        thrill_rating: 7,
        park_id: six_flags.id
      )
      skull_mountain = Ride.create(
        name: 'Skull Mountain',
        thrill_rating: 4,
        park_id: six_flags.id
      )

      expect(six_flags.avg_thrill.round(1)).to eq(5.5)
    end
  end
end

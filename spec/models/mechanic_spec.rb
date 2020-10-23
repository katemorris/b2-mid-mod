require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'instance methods' do
    it '.alpha_rides' do
      @sue = Mechanic.create(name: 'Sue Markell', years_exp: 10)
      @six_flags = Park.create(name: 'Six Flags', price: 35.50)
      @nitro = Ride.create(
        name: 'Nitro',
        thrill_rating: 8,
        park_id: @six_flags.id
      )
      @skull_mountain = Ride.create(
        name: 'Skull Mountain',
        thrill_rating: 4,
        park_id: @six_flags.id
      )
      @toro = Ride.create(
        name: 'El Toro',
        thrill_rating: 8,
        park_id: @six_flags.id
      )
      sue_nitro = RideMechanic.create(mechanic: @sue, ride: @nitro)
      sue_toro = RideMechanic.create(mechanic: @sue, ride: @toro)

      expect(@sue.alpha_rides).to eq([@toro, @nitro])
    end
  end
end

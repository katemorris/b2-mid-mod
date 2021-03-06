require 'rails_helper'

describe 'When I visit an amusement park show page' do
  before (:each) do
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
  end

  it 'I see the park data including a list of rides, average thrill rating' do
    visit "/parks/#{@six_flags.id}"

    within('.park-data') do
      expect(page).to have_content(@six_flags.name)
      expect(page).to have_content("$#{@six_flags.price.round(2)}")
    end

    within('.rides') do
      expect(page).to have_content(@nitro.name)
      expect(page).to have_content(@skull_mountain.name)

      expected = "Average Thrill Rating: #{@six_flags.avg_thrill.round(1)}/10"
      expect(page).to have_content(expected)
    end
  end
end

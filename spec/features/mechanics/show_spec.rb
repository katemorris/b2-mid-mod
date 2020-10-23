require 'rails_helper'

describe "When I visit a mechanic's show page" do
  before (:each) do
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
  end

  it 'I see their data and a way to add a ride to their workload' do
    visit "/mechanics/#{@sue.id}"

    expect(page).to have_content(@sue.name)
    expect(page).to have_content("Years of Experience: #{@sue.years_exp}")

    within('.rides') do
      expect(page).to have_content("Current Rides Assigned:")
      expect(page).to have_content(@nitro.name)
      expect(page).to have_content(@toro.name)
    end

    expect(page).to have_content("Add a ride to workload")
    expect(page).to have_field(:ride_id)
  end

  it 'I can add a ride to their workload' do
    visit "/mechanics/#{@sue.id}"

    fill_in :ride_id, with: @skull_mountain.id
    click_on 'Submit'
    expect(current_path).to eq("/mechanics/#{@sue.id}")

    within('.rides') do
      expect(page).to have_content("Current Rides Assigned:")
      expect(page).to have_content(@nitro.name)
      expect(page).to have_content(@toro.name)
      expect(page).to have_content(@skull_mountain.name)
    end
  end

  it 'I see the list of rides in alphabetical order' do
    visit mechanic_path(@sue)

    within('.rides') do
      expect(page).to have_content("Current Rides Assigned:")
      expect(page.all('li')[0]).to have_content(@toro.name)
      expect(page.all('li')[1]).to have_content(@nitro.name)
    end
  end
end

require 'rails_helper'

describe 'When I visit a mechanics index page' do
  before (:each) do
    @bob = Mechanic.create(name: 'Bob Knife', years_exp: 15)
    @sue = Mechanic.create(name: 'Sue Markell', years_exp: 10)
  end

  it 'I see a list of all mechanics and their experience' do
    visit '/mechanics'

    sue_expected = "#{@sue.name} - #{@sue.years_exp} years of experience"
    bob_expected = "#{@bob.name} - #{@bob.years_exp} years of experience"

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content(sue_expected)
    expect(page).to have_content(bob_expected)
  end

end

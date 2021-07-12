require 'rails_helper'

RSpec.describe 'State Parks creation' do
  it 'links to the new page from the State Parks Index' do
    state = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)

    visit "/states/#{state.id}/parks"
    click_button("New Park in #{state.name}")
    expect(current_path).to eq("/states/#{state.id}/parks/new")
  end

  it 'can create a new state' do
    state = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
    visit "/states/#{state.id}/parks/new"
    fill_in('name', with: 'Test Park')
    check(:camping_allowed)
    check(:kayaking_available)
    fill_in(:park_rating, with: '23')
    click_button("New Park in #{state.name}")

    expect(page).to have_content('Test Park')
    expect(current_path).to eq("/states/#{state.id}/parks")

  end

end

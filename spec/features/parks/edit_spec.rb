require 'rails_helper'

RSpec.describe 'Park edit' do
  it 'links to the edit page' do
    state = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
    park = state.parks.create!(name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)

    visit "/parks/#{park.id}"

    click_button("Update #{park.name}")
    expect(current_path).to eq("/parks/#{park.id}/edit")
  end

  it 'can edit the park' do
    state = State.create!(name: 'Florid', region: 'Southeast', military_discount: true, green_rank: 29)
    park = Park.create!(name: 'Ginny Sprin', camping_allowed: true, kayaking_available: true, park_rating: 4.6, state_id: state.id)

    visit "/parks/#{park.id}"
    expect(page).to have_content('Ginny Sprin')
    click_button 'Update Ginny Sprin'

    visit "/parks/#{park.id}/edit"
    fill_in 'Name', with: 'Ginny Springs'
    check(:camping_allowed)
    check(:kayaking_available)
    fill_in(:park_rating, with: '4.5')
    click_button "Update #{park.name}"

    expect(current_path).to eq("/parks/#{park.id}")
    expect(page).to have_content('Ginny Springs')
  end

end

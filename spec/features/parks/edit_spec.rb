require 'rails_helper'

RSpec.describe 'Park edit' do
  before(:each) do
    @state = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
    @park = @state.parks.create!(name: 'Ginny Sprin', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
  end

  it 'links to the edit page' do
    visit "/parks/#{@park.id}"

    click_link("Update #{@park.name}")

    expect(current_path).to eq("/parks/#{@park.id}/edit")
  end

  it 'can edit the park' do
    visit "/parks/#{@park.id}"

    expect(page).to have_content('Ginny Sprin')
    click_link 'Update Ginny Sprin'
    expect(current_path).to eq("/parks/#{@park.id}/edit")

    fill_in 'Name', with: 'Ginny Springs'
    check(:camping_allowed)
    check(:kayaking_available)
    fill_in(:park_rating, with: '4.6')
    click_button "Update #{@park.name}"

    expect(current_path).to eq("/parks/#{@park.id}")
    expect(page).to have_content('Ginny Springs')
  end
end

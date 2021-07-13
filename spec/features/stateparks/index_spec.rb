require 'rails_helper'

RSpec.describe 'StateParks' do
  describe 'visit state index' do
    before(:each) do
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
      @park_1 = @state_1.parks.create!(name: 'Ginny Springs', camping_allowed: false, kayaking_available: true, park_rating: 4.6)
      @park_2 = @state_1.parks.create!(name: 'Collier-Seminole State Park', camping_allowed: true, kayaking_available: false, park_rating: 4.4)
      @state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true, green_rank: 3)
      @park_3 = @state_2.parks.create!(name: 'Sebago Lake State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.7)
      @park_4 = @state_2.parks.create!(name: "Wolfe's Neck Woods State Park", camping_allowed: false, kayaking_available: false, park_rating: 4.5)
    end

    it 'has the ability to read state content' do
      visit "/states/#{@state_1.id}/parks"

      expect(page).to have_content(@park_1.name)
      expect(page).to have_content("Kayaking available")
      expect(page).to have_content("Kayaking not available")
      expect(page).to have_content("Camping not allowed")
      expect(page).to have_content("Camping allowed")
    end

    it 'has the ability to read state content' do
      visit "/states/#{@state_2.id}/parks"

      expect(page).to have_content(@park_3.name)
      expect(page).to have_content("Kayaking available")
      expect(page).to have_content("Kayaking not available")
      expect(page).to have_content("Camping allowed")
      expect(page).to have_content("Camping not allowed")
    end

    it 'has a link to the list of states' do
      visit "/states/#{@state_1.id}/parks"

      expect(page).to have_link('States')
      click_link 'States'

      expect(current_path).to eq('/states')
    end

    it 'has a link to the list of parks' do
      visit "/states/#{@state_1.id}/parks"

      expect(page).to have_link('Parks')
      click_link 'Parks'

      expect(current_path).to eq('/parks')
    end

    it 'has a link to delete the states' do
      visit "/states/#{@state_1.id}/parks"
      expect(page).to have_button('Delete Ginny Springs')
      expect(page).to_not have_link('Delete Makena')
    end

    it 'actually deletes the state' do
      visit "/states/#{@state_1.id}/parks"

      expect(page).to have_button('Delete Ginny Springs')
      click_button('Delete Ginny Springs')

      expect(page).to_not have_content('Ginny Springs')
    end

    it 'has a button to sort state parks alphabetically' do
      visit "/states/#{@state_1.id}/parks"
      expect(page).to have_link('Sort by Name')
    end

    it 'has a form to sort by minimum park rating' do
      visit "/states/#{@state_1.id}/parks"
      expect(page).to have_content('Minimum Park Rating')
    end

    it 'actually submits that form and filters the results' do
      visit "/states/#{@state_1.id}/parks"
      fill_in(:park_rating, with: '4.6')
      click_button('Save')
      expect(page).to have_content('Ginny Springs')
      expect(page).to_not have_content('Collier-Seminole State Park')
    end

    it 'actually submits that form and filters the results' do
      visit "/states/#{@state_2.id}/parks"
      fill_in(:park_rating, with: '4.8')
      click_button('Save')
      expect(page).to_not have_content('Ginny Springs')
      expect(page).to_not have_content('Collier-Seminole State Park')
    end
  end
end

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
      visit "/states/#{@state_1.id}/parks"
    end

    it 'has the ability to read state park content' do
      expect(page).to have_content(@park_1.name)
      expect(page).to have_content("Kayaking available")
      expect(page).to have_content("Kayaking not available")
      expect(page).to have_content("Camping not allowed")
      expect(page).to have_content("Camping allowed")
    end

    it 'has the ability to read state park content' do
      visit "/states/#{@state_2.id}/parks"

      expect(page).to have_content(@park_3.name)
      expect(page).to have_content("Kayaking available")
      expect(page).to have_content("Kayaking not available")
      expect(page).to have_content("Camping allowed")
      expect(page).to have_content("Camping not allowed")
    end

    it 'has a link to the list of states' do
      expect(page).to have_link('States')
      click_link 'States'

      expect(current_path).to eq('/states')
    end

    it 'has a link to the list of state parks' do
      expect(page).to have_link('Parks')
      click_link 'Parks'

      expect(current_path).to eq('/parks')
    end

    it 'has a link to create a new state park' do
      expect(page).to have_link("New Park in #{@state_1.name}")
    end

    it 'actually links to a form to create a new state park' do
      click_link("New Park in #{@state_1.name}")

      expect(current_path).to eq("/states/#{@state_1.id}/parks/new")
    end

    it 'has a link to delete the state parks' do
      expect(page).to have_button('Delete Ginny Springs')
      expect(page).to_not have_link('Delete Makena')
    end

    it 'actually deletes the state park' do
      expect(page).to have_button('Delete Ginny Springs')
      click_button('Delete Ginny Springs')

      expect(page).to_not have_content('Ginny Springs')
    end

    it 'has a button to sort state parks alphabetically' do
      expect(page).to have_link('Sort Parks by Name')
    end

    it 'actually sorts state parks alphabetically' do
      expect(@park_1.name).to appear_before(@park_2.name)

      click_link('Sort Parks by Name')
      visit "/states/#{@state_1.id}/parks?sort=name"

      expect("Collier").to appear_before("Ginny")
    end

    it 'has a form to sort by minimum state park rating' do
      expect(page).to have_content('Minimum Park Rating')
    end

    it 'actually submits that form and filters the results' do
      fill_in(:park_rating, with: '4.6')
      click_button('Save')

      expect(page).to have_content('Ginny Springs')
      expect(page).to_not have_content('Collier-Seminole State Park')
    end

    it 'actually submits that form and filters the results' do
      fill_in(:park_rating, with: '4.8')
      click_button('Save')

      expect(page).to_not have_content('Ginny Springs')
      expect(page).to_not have_content('Collier-Seminole State Park')
    end
  end
end

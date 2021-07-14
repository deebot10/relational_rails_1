require 'rails_helper'

RSpec.describe 'State' do
  describe 'visit state index' do
    before(:each) do
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
      @state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true, green_rank: 3)
      @state_3 = State.create!(name: 'Washington', region: 'Northwest', military_discount: false, green_rank: 12)
      @state_4 = State.create!(name: 'Oregon', region: 'Northwest', military_discount: false, green_rank: 19)

      visit '/states'
    end

    it 'has the ability to read state content' do
      expect(page).to have_content(@state_1.name)
      expect(page).to have_content(@state_2.region)
      expect(page).to have_content('military discount')
      expect(page).to have_content(@state_3.green_rank)
    end

    it 'orders the states by the most recently created' do
      expect(page).to have_content(@state_1.name)

      this = 'Washington'
      that = 'Maine'
      the_other = 'Florida'

      expect(this).to appear_before(that)
      expect(that).to appear_before(the_other)
    end

    it 'has a link to the list of states' do
      expect(page).to have_link('States')

      click_link 'States'

      expect(current_path).to eq('/states')
    end

    it 'has a link to the list of parks' do
      expect(page).to have_link('Parks')

      click_link 'Parks'

      expect(current_path).to eq('/parks')
    end

    it 'has a link to edit the states' do
      expect(page).to have_button('Edit Florida')
      expect(page).to have_button('Edit Maine')
      expect(page).to have_button('Edit Washington')
      expect(page).to_not have_link('Edit Iowa')
    end

    it 'has a link to delete the states' do
      expect(page).to have_button('Delete Florida')
      expect(page).to have_button('Delete Maine')
      expect(page).to have_button('Delete Washington')
      expect(page).to_not have_link('Delete Iowa')
    end

    it 'can delete the artist from the index page' do
      click_button "Delete #{@state_1.name}"

      expect(current_path).to eq('/states')
      expect(page).to_not have_content('Florida')
    end

    it 'has a link to order the states by park quantity' do
      expect(page).to have_link("Sort States by Quantity of Parks")
    end

    it 'can actually reorder the states by park quantity' do
      @park_1 = @state_1.parks.create!(name: 'Collier-Seminole State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.4)
      @park_2 = @state_1.parks.create!(name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
      @park_3 = @state_1.parks.create!(name: 'Biscayne Bay', camping_allowed: false, kayaking_available: true, park_rating: 4.8)
      @park_4 = @state_2.parks.create!(name: 'Sebago Lake State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.7)
      @park_5 = @state_2.parks.create!(name: "Wolfe's Neck Woods State Park", camping_allowed: false, kayaking_available: false, park_rating: 4.5)
      @park_6 = @state_3.parks.create!(name: 'Crater Lake', camping_allowed: true, kayaking_available: true, park_rating: 4.6)

      this = 'Washington'
      that = 'Maine'
      the_other = 'Florida'
      no_parks = 'Oregon'

      expect(no_parks).to appear_before(this)
      expect(this).to appear_before(that)
      expect(that).to appear_before(the_other)
      click_link "Sort States by Quantity of Parks"
      expect(the_other).to appear_before(that)
      expect(the_other).to appear_before(this)
      expect(that).to appear_before(this)
      expect(this).to appear_before(no_parks)
    end
  end
end

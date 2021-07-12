require 'rails_helper'

RSpec.describe 'State' do
  describe 'visit state index' do
    before(:each) do
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
      @state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true, green_rank: 3)
      @state_3 = State.create!(name: 'Washington', region: 'Northwest', military_discount: false, green_rank: 12)
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
      click_link 'Park'
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


  end
end

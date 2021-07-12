require 'rails_helper'

RSpec.describe 'Park' do
  describe 'visit state index' do
    before(:each) do
      @state = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
      @park_1 = @state.parks.create!(name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
      visit "/parks/#{@park_1.id}"
    end

    it 'has the ability to read state content' do
      expect(page).to have_content(@park_1.name)
      expect(page).to have_content(@park_1.park_rating)
    end

    it 'has a link to update the child' do
      expect(page).to have_content("Update #{@park_1.name}")

      click_button("Update #{@park_1.name}")

      expect(current_path).to eq("/parks/#{@park_1.id}/edit")
    end

    it 'has a link to delete the states' do
      expect(page).to have_button('Delete Ginny Springs')
      expect(page).to_not have_link('Delete Collier')
    end

    it 'actually deletes the state' do
      expect(page).to have_button('Delete Ginny Springs')

      click_button('Delete Ginny Springs')

      expect(page).to_not have_content('Ginny Springs')
    end
  end
end

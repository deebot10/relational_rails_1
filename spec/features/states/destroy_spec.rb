require 'rails_helper'

RSpec.describe 'destroy State' do
  it 'can delete the artist from the index page' do
    state = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
    visit '/states'
    click_button "Delete #{state.name}"
    expect(current_path).to eq('/states')
    expect(page).to_not have_content('Florida')
  end
end

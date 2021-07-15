require 'rails_helper'

RSpec.describe 'State edit' do
  before(:each) do
    @state = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
  end
  
  it 'links to the edit page' do
    visit '/states'

    click_button("Edit #{@state.name}")
    expect(current_path).to eq("/states/#{@state.id}/edit")
  end

  it 'can edit the state' do
    visit '/states'
    expect(page).to have_content('Florid')
    click_button 'Edit Florid'

    visit "/states/#{@state.id}/edit"
    fill_in 'Name', with: 'Florida'
    fill_in 'Region of Country', with: 'Southeast'
    check(:military_discount)
    fill_in 'Green rank', with: '29'
    click_button "Update #{@state.name}"

    expect(current_path).to eq("/states/#{@state.id}")
    expect(page).to have_content('Florida')
  end
end

require 'rails_helper'

RSpec.describe 'State creation' do
  it 'links to the new page from the state index' do
    visit '/states'

    click_link('New State')
    expect(current_path).to eq('/states/new')
  end

  it 'can create a new state' do
    visit '/states/new'

    fill_in('Name', with: 'Georgia')
    fill_in('Camping Military Discount?', with: 'false')
    fill_in('Environmental Rank', with: 35)
    click_button('Create State')
    # new_state_id = State.last.id
    expect(current_path).to eq('/states')
    expect(page).to have_content('Georgia')
  end
end

require 'rails_helper'

RSpec.describe 'Artist index page' do
  before(:each) do
    @artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)
    @artist_2 = Artist.create!(name: 'Noname', age: 29, genre: 'Rap', currently_touring: true)
    @artist_3 = Artist.create!(name: 'Earl Sweatshirt', age: 27, genre: 'Rap', currently_touring: false)
    @artist_4 = Artist.create!(name: 'Frank Ocean', age: 33, genre: 'R&B', currently_touring: false)

    visit '/artists'
  end

  # User Story 1
  it 'can see each Artist record' do
    expect(page).to have_content(@artist_1.name)
    expect(page).to have_content(@artist_2.name)
    expect(page).to have_content(@artist_3.name)
    expect(page).to have_content(@artist_4.name)
  end

  #User Story 6
  it 'Artist show created_at for each record' do

    expect(page).to have_content(@artist_1.created_at)
    expect(page).to have_content(@artist_2.created_at)
    expect(page).to have_content(@artist_3.created_at)
    expect(page).to have_content(@artist_4.created_at)
  end

  it 'shows the artist in order' do
    expect(@artist_4.name).to appear_before(@artist_3.name)
    expect(@artist_3.name).to appear_before(@artist_2.name)
    expect(@artist_2.name).to appear_before(@artist_1.name)
    expect(@artist_1.name).to_not appear_before(@artist_4.name)
  end

  #User Story 8
  it 'has a link to the list of artists' do
    expect(page).to have_link('Artists')

    click_link 'Artists'

    expect(current_path).to eq('/artists')
  end

  #User Story 9
  it 'has a link to the list of albums' do
    expect(page).to have_link('Albums')

    click_link 'Albums'

    expect(current_path).to eq('/albums')
  end

  # User Story 11, Parent Creation 
  it 'Can create new artists with attributes' do

    expect(page).to have_content('Create Artist')

    click_link 'Create Artist'

    expect(current_path).to eq('/artists/new')

    fill_in 'Name', with: 'Drake'
    fill_in 'Age', with: 34
    fill_in 'Genre', with: 'Rap'
    fill_in 'Currently touring', with: 'true'

    click_button 'Create Artist'

    expect(current_path).to eq('/artists')
    
    expect(page).to have_content('Drake') 
  end
  
  #User Story 17
  it 'has a link to update a parent' do

    click_button "Update #{@artist_1.name}"

    expect(current_path).to eq("/artists/#{@artist_1.id}/edit")
  end
end

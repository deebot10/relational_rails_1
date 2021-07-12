require 'rails_helper'

RSpec.describe 'Album Show' do
  before(:each) do
    @artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)
    @album_1 = @artist_1.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)

    visit "/albums/#{@album_1.id}"
  end

    # User Story 4
  it 'visit the album show page' do
    expect(page).to have_content(@album_1.name)
    expect(page).to have_content(@album_1.number_of_songs)
    expect(page).to have_content(@album_1.nominated)
  end

  it 'has a link to the list of albums' do
    expect(page).to have_link('Albums')
    click_link 'Albums'
    expect(current_path).to eq('/albums')
  end

  it 'has a link to the list of artists' do
    expect(page).to have_link('Artists')
    click_link 'Artists'
    expect(current_path).to eq('/artists')
  end

  # User Story 14
  it 'Can update an Album' do

    click_button 'Edit Album'

    expect(current_path).to eq("/albums/#{@album_1.id}/edit")

    fill_in 'Name', with: '3.15.20'
    fill_in 'Number of songs', with: 12 
    fill_in 'Nominated', with: 'false'

    click_button 'Edit Album'
    
    expect(current_path).to eq("/albums/#{@album_1.id}")

    expect(page).to have_content('3.15.20')
  end
  
  # User Story 20
  it 'can delete an album' do
  
    click_button 'Delete Album'
    
    expect(current_path).to eq('/albums')

    expect(page).to_not have_content('Awaken My Love')
  end
end

require 'rails_helper'

RSpec.describe 'Album Index Page' do
  before(:each) do
    @artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)

    @album_1 = @artist_1.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)
    @album_2 = @artist_1.albums.create!(name: 'Because the Internet', number_of_songs: 19, nominated: true)
    @album_3 = @artist_1.albums.create!(name: 'Camp', number_of_songs: 13, nominated: true)

    @artist_2 = Artist.create!(name: 'Noname', age: 29, genre: 'Rap', currently_touring: true)

    @album_4 = @artist_2.albums.create!(name: 'Telefone', number_of_songs: 10, nominated: true)
    @album_5 = @artist_2.albums.create!(name: 'Room 25', number_of_songs: 11, nominated: true)

    @artist_3 = Artist.create!(name: 'Earl Sweatshirt', age: 27, genre: 'Rap', currently_touring: true)

    @album_6 = @artist_3.albums.create!(name: 'Some Rap Songs', number_of_songs: 15, nominated: false)

    visit '/albums'
  end

  # User Story 3
  it 'I see each Child in the system including the Childs attributes' do

    expect(page).to have_content(@album_1.name)
    expect(page).to have_content(@album_1.number_of_songs)
    expect(page).to have_content(@album_1.nominated)

    expect(page).to have_content(@album_2.name)
    expect(page).to have_content(@album_2.number_of_songs)
    expect(page).to have_content(@album_2.nominated)

    expect(page).to have_content(@album_3.name)
    expect(page).to have_content(@album_3.number_of_songs)
    expect(page).to have_content(@album_3.nominated)

    expect(page).to have_content(@album_4.name)
    expect(page).to have_content(@album_4.number_of_songs)
    expect(page).to have_content(@album_4.nominated)

    expect(page).to have_content(@album_5.name)
    expect(page).to have_content(@album_5.number_of_songs)
    expect(page).to have_content(@album_5.nominated)

  end

  #User Story 9
  it 'has a link to the list of albums' do
    expect(page).to have_link('Albums')
    click_link 'Albums'
    expect(current_path).to eq('/albums')
  end
  
  #User Story 10
  it 'has a link to the list of artists' do
    expect(page).to have_link('Artists')
    click_link 'Artists'
    expect(current_path).to eq('/artists')
  end
  
  #User Story 15  
  it 'displays nominated albums only' do

    expect(page).to_not have_content(@album_6.name)
  end
  
  #User Story 18
  it 'has a link to update a album' do

    click_button "Edit #{@album_1.name}"

    expect(current_path).to eq("/albums/#{@album_1.id}/edit")
  end
end

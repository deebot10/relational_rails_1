require 'rails_helper'

RSpec.describe 'Album Index Page' do
  before(:each) do
    @artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)    
    
    @album_1 = @artist_1.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)
    @album_2 = @artist_1.albums.create!(name: 'Because the Internet', number_of_songs: 19, nominated: false)
    @album_3 = @artist_1.albums.create!(name: 'Camp', number_of_songs: 13, nominated: false)
    
    @artist_2 = Artist.create!(name: 'Noname', age: 29, genre: 'Rap', currently_touring: true)

    @album_4 = @artist_2.albums.create!(name: 'Telefone', number_of_songs: 10, nominated: false)
    @album_5 = @artist_2.albums.create!(name: 'Room 25', number_of_songs: 11, nominated: false)

    @artist_3 = Artist.create!(name: 'Earl Sweatshirt', age: 27, genre: 'Rap', currently_touring: false)

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

    expect(page).to have_content(@album_6.name)
    expect(page).to have_content(@album_6.number_of_songs)
    expect(page).to have_content(@album_6.nominated)
  end
end
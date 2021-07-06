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

    @album_6 = Artist.create!(name: 'Some Rap Songs', number_of_songs: 15, nominated: false)
  end    
end
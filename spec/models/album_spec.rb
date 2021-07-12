require 'rails_helper'

RSpec.describe Album do
  describe 'relationships' do
    it {should belong_to(:artist) }    
  end 

  before(:each) do
    @artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)    
    @artist_2 = Artist.create!(name: 'Noname', age: 29, genre: 'Rap', currently_touring: true)
    @artist_3 = Artist.create!(name: 'Earl Sweatshirt', age: 27, genre: 'Rap', currently_touring: false)
    @artist_4 = Artist.create!(name: 'Frank Ocean', age: 33, genre: 'R&B', currently_touring: false)

    @album_1 = @artist_1.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)
    @album_2 = @artist_1.albums.create!(name: 'Because the Internet', number_of_songs: 19, nominated: false)
    @album_3 = @artist_1.albums.create!(name: 'Camp', number_of_songs: 13, nominated: false)
  end

  describe 'class methods' do 
    it 'will grab albums that are nominated: true ' do

      expect(Album.nominated_albums).to eq([@album_1])
    end     
  end
  describe 'instance methods'    
  describe 'validations'
end
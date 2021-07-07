require 'rails_helper'

RSpec.describe Artist do
  describe 'relationships' do
    it {should have_many(:albums)}    
  end

  before(:each) do
    @artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)    
    @artist_2 = Artist.create!(name: 'Noname', age: 29, genre: 'Rap', currently_touring: true)
    @artist_3 = Artist.create!(name: 'Earl Sweatshirt', age: 27, genre: 'Rap', currently_touring: false)
    @artist_4 = Artist.create!(name: 'Frank Ocean', age: 33, genre: 'R&B', currently_touring: false)
  end

  describe 'class methods' do
    # User Story 6
    it 'Sorts all the parent records by most recently created' do
    
      expect(Artist.order_created).to eq([@artist_4, @artist_3, @artist_2, @artist_1])
    end    
  end
  describe 'instance methods'     
  describe 'validations'
end
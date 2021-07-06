require 'rails_helper'

RSpec.describe Artist do
  describe 'relationships' do
    it {should have_many(:albums)}    
  end
  
  describe 'instance methods'    
  describe 'class methods'
  describe 'validations'
end
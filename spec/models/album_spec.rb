require 'rails_helper'

RSpec.describe Album do
  describe 'relationships' do
    it {should belong_to(:artist) }    
  end

  describe 'instance methods'    
  describe 'class methods'
  describe 'validations'
end
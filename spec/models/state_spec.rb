require 'rails_helper'

RSpec.describe State do
  describe 'relationships' do
    it {should have_many(:parks)}
    
  end
end

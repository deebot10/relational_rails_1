require 'rails_helper'

RSpec.describe Park do
  describe 'relationships' do
    it {should belong_to(:state)}

  end
end

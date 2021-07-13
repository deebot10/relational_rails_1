class State < ApplicationRecord
  has_many :parks, dependent: :destroy

  def parks_count
    parks.count
  end

end

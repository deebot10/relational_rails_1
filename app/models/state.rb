class State < ApplicationRecord
  has_many :parks, dependent: :destroy

  def parks_count
    parks.count
  end

  def self.quant
    joins(:parks).group("states.id").order("COUNT(states.id) DESC")
  end

end

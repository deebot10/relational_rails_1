class State < ApplicationRecord
  has_many :parks, dependent: :destroy

  def parks_count
    parks.count
  end

  def self.quant
    # joins(:parks).group("states.id").order(Arel.sql("COUNT(states.id) DESC"))
    joins("LEFT JOIN parks ON parks.state_id = states.id").group("states.id").order(Arel.sql("COUNT(states.id) DESC"))
  end

end

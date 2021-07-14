class State < ApplicationRecord
  has_many :parks, dependent: :destroy

  def parks_count
    parks.count
  end

  def self.quant
    # todo: remove this reference code after mod 2

    # joins(:parks).group("states.id").order("COUNT(states.id) DESC")
    # ▲ is the same as same as ▼
    # joins("INNER JOIN parks on parks.state_id = states.id").group("states.id").order("COUNT(states.id) DESC")

    #LEFT JOIN allows for parent records with null children to display as well.  INNER JOIN restricts results to parents w/ children
    joins("LEFT JOIN parks ON parks.state_id = states.id").group("states.id").order(Arel.sql("COUNT(states.id) DESC"))
  end

end

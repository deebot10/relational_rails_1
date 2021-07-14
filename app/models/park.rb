class Park < ApplicationRecord
  belongs_to :state, touch: true

  def self.camping
    where(camping_allowed: :true)
  end

  def self.minimum_rating(params)
    where("park_rating >= ?", params)
  end
  
end

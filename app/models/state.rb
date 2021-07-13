class State < ApplicationRecord
  has_many :parks, dependent: :destroy
   # -> { order(created_at: :desc) },
  # scope :most_recent, -> (50) { order("created_at desc").limit(50) }

  def self.order_created_at
    order(created_at: :desc)
  end

  def parks_count
    parks.count
  end

end

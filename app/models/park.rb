class Park < ApplicationRecord
  belongs_to :state, touch: true

  def self.camping
    where(camping_allowed: :true)
  end
end

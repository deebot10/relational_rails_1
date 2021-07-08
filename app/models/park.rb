class Park < ApplicationRecord
  belongs_to :state, touch: true
end

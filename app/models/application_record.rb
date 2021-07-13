class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_created
    order(created_at: :desc)
  end

  def self.alphabatize
    order(:name)
  end

end

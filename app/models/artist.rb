class Artist < ApplicationRecord
  has_many :albums     
  
  def self.order_created
    order(created_at: :desc)      
  end
end
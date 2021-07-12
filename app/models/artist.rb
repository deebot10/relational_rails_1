class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy     
  
  def self.order_created
    order(created_at: :desc)      
  end

  def album_count
    albums.count
  end
end
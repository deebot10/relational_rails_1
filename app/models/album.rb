class Album < ApplicationRecord
  belongs_to :artist   
  
  def self.nominated_albums
    where(nominated: :true)
  end
end
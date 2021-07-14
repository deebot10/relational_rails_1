class Album < ApplicationRecord
  belongs_to :artist   
  
  def self.nominated_albums
    where(nominated: :true)
  end

  def self.num_of_tracks(params)
    where('number_of_songs >= ?', params)    
  end
end
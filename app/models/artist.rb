class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  def album_count
    albums.count
  end
end

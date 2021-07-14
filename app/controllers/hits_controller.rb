class HitsController < ApplicationController
  def index
    @artists = Artist.find(params[:id])

    if params[:sort] == 'true'
      @albums = @artists.albums.alphabatize
    elsif params[:number_of_songs]
      @albums = @artists.albums.num_of_tracks(params[:number_of_songs])  
    else 
      @albums = @artists.albums
    end
  end    

  def new
    @artist = Artist.find(params[:id])  
  end

  def create
    artist = Artist.find(params[:id])
    album = artist.albums.create!(album_params)
    redirect_to "/artists/#{artist.id}/albums"          
  end

  private
  def album_params
    params.permit(:name, :number_of_songs, :nominated)
  end
end
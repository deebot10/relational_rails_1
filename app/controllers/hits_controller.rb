class HitsController < ApplicationController
  def index
    @artists = Artist.find(params[:id])  
    @albums = @artists.albums 
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
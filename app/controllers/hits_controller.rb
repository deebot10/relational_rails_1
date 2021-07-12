class HitsController < ApplicationController
  def index
    if params[:sort]
      @artists = Artist.find(params[:id])   
      @albums = @artists.albums.alphabatize 
      require 'pry'; binding.pry
    else 
      @artists = Artist.find(params[:id])   
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
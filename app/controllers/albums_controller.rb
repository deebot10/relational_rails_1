class AlbumsController < ApplicationController 
  def index
    @albums = Album.all    
  end    

  def show
    @album = Album.find(params[:id])  
  end

  def edit
    @album = Album.find(params[:id])    
  end

  def update
    album = Album.find(params[:id])
    album.update(album_params)
    redirect_to "/albums/#{album.id}"
  end

  private
  def album_params
    params.permit(:name, :number_of_songs, :nominated)
  end
end
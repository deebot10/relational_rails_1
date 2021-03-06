class AlbumsController < ApplicationController 
  def index
    @albums = Album.all.nominated_albums    
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

  def destroy
    album = Album.find(params[:id])
    album.destroy 
    redirect_to '/albums'
  end

  private
  def album_params
    params.permit(:name, :number_of_songs, :nominated)
  end
end
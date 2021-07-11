class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.order_created    
  end    

  def show
    @artist = Artist.find(params[:id])  
  end

  def new;end
  
  def create
    
  end

  private
  def artist_params
    params.permit(:name)
    params.permit(:age)
    params.permit(:genre)
    params.permit(:currently_touring)
  end
end
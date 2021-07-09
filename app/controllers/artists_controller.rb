class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.order_created    
  end    

  def show
    @artist = Artist.find(params[:id])  
  end

  def new
    
  end
  
end
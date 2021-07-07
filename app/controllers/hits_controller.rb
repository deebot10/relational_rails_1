class HitsController < ApplicationController
  def index
    @artists = Artist.find(params[:id])  
    @albums = @artist.albums      
  end    
end
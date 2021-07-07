class HitsController < ApplicationController
  def index
    @artists = Artist.find(params[:id])  
    @albums = @artists.albums 
  end    
end
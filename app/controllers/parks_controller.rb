class ParksController < ApplicationController
  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    @park.update(park_params)
    redirect_to "/parks/#{@park.id}"
  end

  #only available inside the class theyre defined in
    def park_params
      params.permit(:name, :kayaking_available, :park_rating, :camping_allowed, :state_id)
    end
end

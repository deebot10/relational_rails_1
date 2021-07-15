class ParksController < ApplicationController
  def index
    @parks = Park.all.camping
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

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    redirect_to '/parks'
  end

  private
  def park_params
    params.permit(:name, :kayaking_available, :park_rating, :camping_allowed, :state_id)
  end
end

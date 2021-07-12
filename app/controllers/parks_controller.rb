class ParksController < ApplicationController
  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
  end

  #only available inside the class theyre defined in
    def park_params
      params.permit(:name, :region, :military_discount, :green_rank, :state_id)
    end
end

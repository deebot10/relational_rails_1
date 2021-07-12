class StateparksController < ApplicationController
  def index
    @states = State.find(params[:state_id])
    @parks = @states.parks
  end

  def new
    @state = State.find(params[:state_id])
  end

  def create
    state = State.find(params[:state_id])
    @park = Park.create!(state_park_params)
    redirect_to new_state_park_path(state)
  end

private
  def state_park_params
    params.permit(:name, :camping_allowed, :kayaking_available, :park_rating, :state_id)
  end

end

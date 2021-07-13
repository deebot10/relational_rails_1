class StateparksController < ApplicationController
  def index
    @states = State.find(params[:state_id])
    if params[:sort]=='name'
      @parks = @states.parks.alphabatize
    elsif params[:park_rating]
      @parks = @states.parks.minimum_rating(params[:park_rating])
    else
      @parks = @states.parks
    end
  end

  def new
    @state = State.find(params[:state_id])
  end

  def create
    state = State.find(params[:state_id])
    park = state.parks.create!(state_park_params)
    redirect_to new_state_park_path(state)
  end

private
  def state_park_params
    params.permit(:id, :state_id, :name, :camping_allowed, :kayaking_available, :park_rating)
  end

end

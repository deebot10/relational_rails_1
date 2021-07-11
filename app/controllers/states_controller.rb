class StatesController < ApplicationController
  def index
    @states = State.all
  end

  def show
    @state = State.find(params[:id])
  end

  def new
  end

  def create
    state = State.create(state_params)
    redirect_to '/states'
  end

  def state_params
    params.permit(:name, :region, :military_discount, :green_rank)
  end

end

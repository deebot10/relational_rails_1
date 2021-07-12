class StatesController < ApplicationController
  def index
    @states = State.all
  end

  def show
    @state = State.find(params[:id])
  end

  def new
    @state = State.create!(state_params)
  end

  def create
    state = State.create!(state_params)
    redirect_to '/states'
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
    state = State.find(params[:id])
    state.update(state_params)
    redirect_to "/states/#{state.id}"
  end

  def destroy
    state = State.find(params[:id])
    state.destroy
    redirect_to '/states'
  end

private
#only available inside the class theyre defined in
  def state_params
    params.permit(:name, :region, :military_discount, :green_rank)
  end
end

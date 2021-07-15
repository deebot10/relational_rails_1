class StatesController < ApplicationController
  def index
    @states = State.all
    if params[:sort]=='quant'
      @states = @states.quant
    else
      @states = @states.order_created
    end
  end

  def show
    @state = State.find(params[:id])
  end

  def new
  end

  def create
    state = State.create!(state_params)
    redirect_to '/states'
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
    @state = State.find(params[:id])
    @state.update(state_params)
    redirect_to "/states/#{@state.id}"
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
    redirect_to '/states'
  end

private
  def state_params
    params.permit(:id, :name, :region, :military_discount, :green_rank)
  end
end

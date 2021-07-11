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
    state = State.create!(name: params['name'], region: params[:region], military_discount: params[:military_discount], green_rank: params[:green_rank])
    redirect_to '/states'
  end

end

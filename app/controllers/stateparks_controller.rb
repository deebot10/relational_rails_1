class StateparksController < ApplicationController
  def index
    @states = State.find(params[:id])
    @parks = @states.parks
  end
end

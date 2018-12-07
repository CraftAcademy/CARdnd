class AutomobilesController < ApplicationController
  def index
    @automobiles = Automobile.all
  end
  def show
    @automobile = Automobile.find(params[:id])
  end

  def new
    @automobile = Automobile.new
  end

  def create
    @automobile = Automobile.new(automobile_params)
    @automobile["user_id"] = current_user["id"]
    -if @automobile.save
      redirect_to user_path(current_user)
      flash[:success] = 'Car succesfully added'
    else
      render new_automobile_path
    end
  end

  private

  def automobile_params
    params.require(:automobile).permit(:brand, :model, :year, :price, :engine, :description)
  end

end
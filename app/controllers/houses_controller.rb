class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  def index
    @houses = current_user.houses
  end

  def show
  end

  def new
    @house = current_user.house.new
  end

  def edit
  end

  def create 
    @house = current_user.house.new(house_params)

    if @house.save 
      redirect_to @house, notice: "House Has Been Created"
    else 
      render :new
    end
  end 

  def update 
    if @house.update(house_params)
      redirect_to @house, notice: "House Changed"
    else
      render :edit
    end
  end 

  def destroy 
    @house.destroy
    redirect_to house_url, notice: 'House Has Been DEMOLISHED'
  end 

  private 

    def set_house 
      @house = House.find(params[:id])
    end

    def house_params 
      params.require(:house).permit(:price, :mobile, :city, :description)
    end
end

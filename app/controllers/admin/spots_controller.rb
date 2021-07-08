class Admin::SpotsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @spots = Spot.all
    @areas = Area.all
    @purposes = Purpose.all
  end

  def new
    @spot = Spot.new
    @areas = Area.all
    @purposes = Purpose.all
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.save
    redirect_to admin_spots_path
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)
    redirect_to admin_spots_path
  end

  def destroy
    @spots = Spot.find(params[:id])
    @spots.destroy
    redirect_to admin_spots_path
  end

  private


  def spot_params
    params.require(:spot).permit(:area_id, :purpose_id, :name, :description, :image_id)
  end

end

class Admin::SpotsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @spots = Spot.all.page(params[:page]).per(5)
    @areas = Area.all
    @purposes = Purpose.all
  end

  def new
    @spot = Spot.new
    @areas = Area.all
    @purposes = Purpose.all
  end

  def create
    @areas = Area.all
    @purposes = Purpose.all
    @spot = Spot.new(spot_params)
    @spot.save
    redirect_to admin_spots_path
  end

  def edit
    @areas = Area.all
    @purposes = Purpose.all
    @spot = Spot.find(params[:id])
  end

  def update
    @areas = Area.all
    @purposes = Purpose.all
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
    params.require(:spot).permit(:area_id, :purpose_id, :name, :description, :image)
  end

end

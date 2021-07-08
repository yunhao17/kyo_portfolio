class Admin::AreasController < ApplicationController

  before_action :authenticate_admin!

  def index
    @areas = Area.all
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    @area.save
    redirect_to admin_areas_path
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    @area.update(area_params)
    redirect_to admin_areas_path
  end

  def destroy
    @areas = Area.find(params[:id])
    @areas.destroy
    redirect_to admin_areas_path
  end

  private


  def area_params
    params.require(:area).permit(:name, :description, :image_id)
  end

end

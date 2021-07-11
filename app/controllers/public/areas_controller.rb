class Public::AreasController < ApplicationController

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    @purposes = Purpose.all
  end

  private

  def area_params
    params.require(:area).permit(:name, :description, :image_id)
  end

end


class Public::AreasController < ApplicationController
  
  before_action :authenticate_user!

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


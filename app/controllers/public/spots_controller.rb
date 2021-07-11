class Public::SpotsController < ApplicationController

  def index
    @spots = Spot.all
  end
 
  def eria_index
    @spots = Spot.where(area_id: params[:area_id] ,purpose_id: params[:purpose_id])
    render :index
  end

  def mokuteki_index
    @spots = Spot.where(purpose_id: params[:id])
    render :index
  end


  def show
   @spot = Spot.find(params[:id])
  end


  private

  def spot_params
    params.require(:spot).permit(:area_id, :purpose_id, :name, :description, :image_id)
  end
end

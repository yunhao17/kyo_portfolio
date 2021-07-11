class Public::SpotsController < ApplicationController
  
  def index
    
  end
  
  def show
   @spot = Spot.find(params[:id])
  end
  
  
  private

  def spot_params
    params.require(:spot).permit(:area_id, :purpose_id, :name, :description, :image_id)
  end
end

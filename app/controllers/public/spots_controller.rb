class Public::SpotsController < ApplicationController

  def index
    @spots = Spot.all
  end

  def eria_mokuteki
    @spots = Spot.where(area_id: params[:area_id] ,purpose_id: params[:purpose_id])
    render :index
  end

  def mokuteki
    @spots = Spot.where(purpose_id: params[:purpose_id])
    render :index
  end

# 　sort {|a,b| b.favorited_users.count <=> a.favorited_users.count}

  def show
   @spot = Spot.find(params[:id])
   @spot_comment = SpotComment.new
  end


  private

  def spot_params
    params.require(:spot).permit(:area_id, :purpose_id, :name, :description, :image_id)
  end
end

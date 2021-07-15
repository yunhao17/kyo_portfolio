class Public::SpotsController < ApplicationController

  def index
    if params[:sort] == "favo"
      # n + 1 問題が発生しているので可能であれば改善してみる
      @spots = Spot.all.page(params[:page]).per(8).sort{|a,b| b.favorited_users.count <=> a.favorited_users.count}
    else
      @spots = Spot.all.page(params[:page]).per(8)
    end
  end

  def eria_mokuteki
    if params[:sort] == "favo"
      @spots = Spot.where(area_id: params[:area_id] ,purpose_id: params[:purpose_id]).page(params[:page]).per(8).sort{|a,b| b.favorited_users.count <=> a.favorited_users.count}
    else
      @spots = Spot.where(area_id: params[:area_id] ,purpose_id: params[:purpose_id]).page(params[:page]).per(8)
    end
    render :index
  end

  def mokuteki
    if params[:sort] == "favo"
      @spots = Spot.where(purpose_id: params[:purpose_id]).page(params[:page]).per(8).sort{|a,b| b.favorited_users.count <=> a.favorited_users.count}
    else
      @spots = Spot.where(purpose_id: params[:purpose_id]).page(params[:page]).per(8)
    end
    render :index
  end

  def show
   @spot = Spot.find(params[:id])
   @spot_comment = SpotComment.new
  end


  private

  def spot_params
    params.require(:spot).permit(:area_id, :purpose_id, :name, :description, :image_id)
  end
end

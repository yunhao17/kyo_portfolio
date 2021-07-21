class Public::SpotsController < ApplicationController

  before_action :authenticate_user!

  def index
    if params[:sort] == "favo"
      # n + 1 問題が発生しているので可能であれば改善してみる
      @spots = Spot.all.sort{|a,b| b.favorited_users.count <=> a.favorited_users.count}
      @spots = Kaminari.paginate_array(@spots).page(params[:page]).per(5)
    else
      @spots = Spot.all.page(params[:page]).per(5)
    end
  end

  def eria_mokuteki
    if params[:sort] == "favo"
      @spots = Spot.where(area_id: params[:area_id] ,purpose_id: params[:purpose_id]).sort{|a,b| b.favorited_users.count <=> a.favorited_users.count}
      @spots = Kaminari.paginate_array(@spots).page(params[:page]).per(5)
    else
      @spots = Spot.where(area_id: params[:area_id] ,purpose_id: params[:purpose_id]).page(params[:page]).per(5)
    end
    render :index
  end

  def mokuteki
    if params[:sort] == "favo"
      @spots = Spot.where(purpose_id: params[:purpose_id]).sort{|a,b| b.favorited_users.count <=> a.favorited_users.count}
      @spots = Kaminari.paginate_array(@spots).page(params[:page]).per(5)
    else
      @spots = Spot.where(purpose_id: params[:purpose_id]).page(params[:page]).per(5)
    end
    render :index
  end

  def show
   @spot = Spot.find(params[:id])
   @spot_comment = SpotComment.new
   @spot_comments = @spot.spot_comments.page(params[:page]).per(5)
  end


  private

  def spot_params
    params.require(:spot).permit(:area_id, :purpose_id, :name, :description, :image)
  end
end

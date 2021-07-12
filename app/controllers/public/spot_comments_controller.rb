class Public::SpotCommentsController < ApplicationController

  def create
    @spot = Spot.find(params[:spot_id])
    @spot_comment = current_user.spot_comments.new(spot_comment_params)
    @spot_comment.spot_id = @spot.id
    @spot_comment.save
    redirect_to spot_path(params[:spot_id])
  end

  def destroy
    SpotComment.find_by(id: params[:id], spot_id: params[:spot_id]).destroy
    redirect_to spot_path(params[:spot_id])
  end

  private

  def spot_comment_params
    params.require(:spot_comment).permit(:comment)
  end

end

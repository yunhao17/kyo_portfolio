class Public::SearchesController < ApplicationController
  
  before_action :authenticate_user!

  def search
    @spots = Spot.search(params[:keyword]).page(params[:page]).per(5)
    @keyword = params[:keyword]
    render 'searchs'
  end
end

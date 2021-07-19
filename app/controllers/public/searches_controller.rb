class Public::SearchesController < ApplicationController
  
  before_action :authenticate_user!

  def search
    @spots = Spot.search(params[:keyword])
    @keyword = params[:keyword]
    render 'searchs'
  end

end

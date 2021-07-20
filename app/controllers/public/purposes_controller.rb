class Public::PurposesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @purposes = Purpose.all
  end
  
  private

  def purpose_params
    params.require(:purpose).permit(:name)
  end

end

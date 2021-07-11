class Public::PurposesController < ApplicationController
  
  def index
    @purposes = Purpose.all
  end
  
  private

  def purpose_params
    params.require(:purpose).permit(:name)
  end

end

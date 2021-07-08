class Admin::PurposesController < ApplicationController
  
  before_action :authenticate_admin!
  def index
    @purpose = Purpose.new
    @purposes = Purpose.all
  end

  def create
    @purpose = Purpose.new(purpose_params)
    @purpose.save
    redirect_to admin_purposes_path
  end

  def destroy
    @purposes = Purpose.find(params[:id])
    @purposes.destroy
    redirect_to admin_purposes_path
  end


  private


  def purpose_params
    params.require(:purpose).permit(:name)
  end

end

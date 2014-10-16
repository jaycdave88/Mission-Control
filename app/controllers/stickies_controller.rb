class StickiesController < ApplicationController
  before_filter :find_sticky

  def new
    
  end

  def create
    @sticky = Sticky.create(sticky_params)

    redirect_to @sticky
  end
  
  def show
    find_sticky  
  end

  private
  def find_sticky
    @sticky = Sticky.find(params[:id]) if params[:id]
  end

  def sticky_params
    params.require(:sticky).permit(:title, :content)
  end
end
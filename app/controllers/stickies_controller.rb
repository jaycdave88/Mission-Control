class StickiesController < ApplicationController

  def new
    @sticky = Sticky.new
  end

  def index
    @stickies = Sticky.all.includes(:user)
  end

  def create
    @sticky = Sticky.new(sticky_params)
    @sticky.user_id = session[:user_id]
    @sticky.save
    redirect_to @sticky
  end

  def show
    set_sticky
    @helps = @sticky.helps
    render partial: 'show'
  end

  def edit
    set_sticky
  end

  def update
    set_sticky.update(sticky_params)
    redirect_to @sticky
  end

  def destroy
    set_sticky.destroy
    redirect_to stickies_path
  end

  private
  def set_sticky
    @sticky = Sticky.find(params[:id])
  end

  def sticky_params
    params.require(:sticky).permit(:title, :content, :image)
  end

end


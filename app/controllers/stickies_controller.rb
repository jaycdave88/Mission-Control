class StickiesController < ApplicationController
  before_filter :find_sticky

  def new
    @sticky = Sticky.new
  end

  def index
    @stickies = Sticky.all.includes(:user)  

  end

  def create
    @sticky = Sticky.create(sticky_params)
    @sticky.update(user_id: session[:user_id])
    redirect_to @sticky
  end

  def show
    find_sticky
    @helps = @sticky.helps
  end

  def edit
    find_sticky
  end

  def update
    find_sticky.update(sticky_params)
    redirect_to @sticky
  end

  def destroy
    find_sticky.destroy
    redirect_to stickies_path
  end

  private
  def find_sticky
    @sticky = Sticky.find(params[:id]) if params[:id]
  end

  def sticky_params
    params.require(:sticky).permit(:title, :content, :image)
  end

end

# this is just so I can push to heroku
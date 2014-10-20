class HelpsController < ApplicationController

  def new
  end
  def show

  end

  def create
    @sticky = Sticky.find(params[:sticky_id])
    help = @sticky.helps.new(help_params)
    help.user_id =session[:user_id]
    help.save
    redirect_to @sticky
  end

  def edit
    @help = Help.find(params[:id])
  end

  def update
    @help = Help.find(params[:id])
    @help.update(help_params)
    redirect_to @help.sticky
  end

  def destroy
    @help = Help.find(params[:id])
    @help.destroy
    redirect_to stickies_path
  end

  private

  def help_params
    params.require(:help).permit(:title, :content)
  end
end
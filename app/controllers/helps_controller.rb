class HelpsController < ApplicationController

  def new
  end

  def create
    @sticky = Sticky.find(params[:sticky_id])
    @sticky.helps.create(
      :title=> params[:help][:title],
      :content=>params[:help][:content]
    )

    redirect_to @sticky
  end

  def edit
    find_help
  end

  def update
    find_help.update(help_params)
    redirect_to @help.sticky
  end

  def destroy
    find_help.destroy
    redirect_to stickies_path
  end

  private
  def find_help
    @help = Help.find(params[:id]) if params[:id]
  end

  def help_params
    params.require(:help).permit(:title, :content)
  end
end
class HelpsController < ApplicationController
  before_filter :find_help

  def new
  end

  def create
    puts "*********************"
    p params
    puts "*********************"
    @help = Help.create(
      :title=> params[:help][:title],
      :content=>params[:help][:content]
    )

    redirect_to stickies_path
  end




  private
  def find_help
    @help = Helps.find(params[:id]) if params[:id]
  end
end
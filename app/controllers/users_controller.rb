class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new
	end

	def login
		@user = User.new
	end


	def create_session
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to show_users_path(user.id)
		else
			flash[:notice] = "Invalid email or password"
			render :login
		end
	end

	def create
		@user = User.new(params.require(:user).permit(:name, :email, :phase, :password))
    if @user.save
      flash[:notice] = "Signed up!"
      session[:user_id] = @user.id
      redirect_to show_users_path(@user.id)
    else
      render "new"
    end

	end


	def show
		@user= User.find(params[:id])
    @stickies = @user.stickies
	end

end


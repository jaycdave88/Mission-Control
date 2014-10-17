class UsersController < ApplicationController

	def index
	end

	def login
		@user = User.new
	end

	def new
		User.find_by(email: params[:email])

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

	# def create
	# 	User.create(params[:user])

	# end


	def show
		@user= User.find(params[:id])
	end

end


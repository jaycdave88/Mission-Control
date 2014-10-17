class UsersController < ApplicationController

	def index
	end

	def login
		User.find_by(params[:email])

	end

	def create
		User.create(params[:user])

	end

end
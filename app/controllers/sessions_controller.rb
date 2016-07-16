class SessionsController < ApplicationController
	  include SessionsHelper


	def new
		redirect_to @current_user if @current_user
	end

	def create
		user = User.confirm(params[:email], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to user_path(user.id)
		else
			flash[:error] = "Failed to authenticate. Please try again."
			redirect_to '/login'
		end
	end


	def destroy
		logout
		redirect_to root_path
	end

end
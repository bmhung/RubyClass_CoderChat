class SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		@email = params[:email]
		@pass = params[:password]

		@user = User.find_by(email: @email)
		if @user
			if @user.authenticate(@pass)
				session[:user_id] = @user.id
				flash[:success] = "Login successful!!!"
				return redirect_to messages_path
			end
		end
		flash[:error] = "Login failed!"
		redirect_to sign_in_path
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logout successful!!!"
		reset_session
		redirect_to root_path
	end
end
class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user, :signed_in?, :require_login, :skip_if_logged_in
	def current_user
		return @current_user if @current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end

	def signed_in?
		!!current_user
	end

	def require_login
		unless session[:user_id]
			redirect_to sign_in_path
		end
	end

	def skip_if_logged_in
		if session[:user_id]
			redirect_to messages_path
		end
	end
end

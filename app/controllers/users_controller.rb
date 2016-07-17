class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	helper UsersHelper

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to messages_path
		else
			flash[:error] = @user.errors.full_messages.to_sentence
			render "new"
		end
	end

	def user_params
		params.required(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def add_friend
		@users = User.all
		if request.post?
			friend = User.find(params[:user_id])
			current_user = User.find(session[:user_id])
			current_user.friends << friend
			flash[:success] = 'You have added ' + friend.name
		end
	end

	def remove_friend
		friend = User.find(params[:user_id])
		current_user = User.find(session[:user_id])
		current_user.friends.delete(friend)
		flash[:success] = 'You have unfriend ' + friend.name
		redirect_to add_friend_path
	end
end

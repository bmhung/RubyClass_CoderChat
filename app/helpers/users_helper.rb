module UsersHelper
	def is_friend?(friend_id)
		current_user = User.find(session[:user_id])
		friend = current_user.friends.find_by_id(friend_id)
		return !!friend
	end
end

class MessagesController < ApplicationController
	def index
		@current_user = User.find(session[:user_id])
		@messages = @current_user.incoming_messages.order(created_at: :desc)
	end

	def sent
		@current_user = User.find(session[:user_id])
		@messages = @current_user.outgoing_messages
	end

	def new
		@message = Message.new
		@current_user = User.find(session[:user_id])
	end

	def create
		@current_user = User.find(session[:user_id])

		@message = Message.new
		@message.title = message_params[:title]
		@message.content = message_params[:content]
		@message.from_user = User.find(message_params[:from_user_id])

		message_params[:to_users].each do |id|
			@message.to_users<<User.find(id)
		end

		if @message.save
			flash[:success] = "Message sent!"
			redirect_to sent_messages_path
		else
			flash[:error] = @message.errors.full_messages.to_sentence
			render "new"
		end
	end

	def message_params
		params.required(:message).permit(:title, :content, :from_user_id, :to_users => [])
	end

	def show
		message = Message.find(params[:id])
		unless message.read_at
			message.read_at = DateTime.current
			message.save
			return @message = message
		end
	end
end

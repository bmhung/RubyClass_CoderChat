class Message < ApplicationRecord
	belongs_to :from_user, class_name: 'User', foreign_key: 'user_id'
	has_and_belongs_to_many :to_users, class_name: 'User', join_table: 'message_to_users'
end

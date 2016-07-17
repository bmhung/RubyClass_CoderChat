class User < ApplicationRecord
	has_secure_password
	validates :name, presence: true
	validates :email, presence: true, format: {with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/, message: "is not valid format"}, uniqueness: { case_sensitive: false}
	validates :password, confirmation: true

	has_and_belongs_to_many :friends, class_name: 'User', foreign_key: 'user_id', association_foreign_key: 'friend_id', join_table: 'friendships'

	has_and_belongs_to_many :incoming_messages, class_name: 'Message', join_table: 'message_to_users'
	has_many :outgoing_messages, class_name: 'Message'
end

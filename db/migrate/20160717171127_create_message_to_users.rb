class CreateMessageToUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :message_to_users do |t|
    	t.integer :user_id
    	t.integer :message_id
    end

    add_index :message_to_users, :user_id
    add_index :message_to_users, :message_id
  end
end

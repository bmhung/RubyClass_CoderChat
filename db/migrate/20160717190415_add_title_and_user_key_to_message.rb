class AddTitleAndUserKeyToMessage < ActiveRecord::Migration[5.0]
  def change
  	add_column :messages, :title, :string
  	add_reference :messages, :user, foreign_key: true
  end
end

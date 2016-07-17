class FixReadTimeToMessage < ActiveRecord::Migration[5.0]
  def change
  	remove_column :messages, :reat_at
  	add_column :messages, :reat_at, :datetime
  end
end

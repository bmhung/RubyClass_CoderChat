class AddReadTimeToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :reat_at, :time
  end
end

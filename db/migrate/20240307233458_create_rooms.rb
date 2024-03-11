class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|

      t.timestamps
      t.integer :entry_id
      t.integer :message_id
    end
  end
end

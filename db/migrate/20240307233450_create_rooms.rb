class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|

      t.timestamps
      t.references :entry, null: false, foreign_key: true #追加
      t.integer :message_id
    end
  end
end

class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|

      t.timestamps
      t.integer :admin_id
      t.integer :customer_id
      t.integer :room_id
    end
  end
end

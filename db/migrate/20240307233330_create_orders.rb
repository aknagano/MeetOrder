class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method, null: false
      t.integer :customer_id
      t.integer :order_status, null: false, default:0
      t.datetime :delivery_date, null: false
    end
  end
end

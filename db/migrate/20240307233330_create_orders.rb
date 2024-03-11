class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.string :post_code
      t.string :address
      t.string :name
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method
      t.integer :customer_id
      t.integer :order_status, null: false, default:0
    end
  end
end

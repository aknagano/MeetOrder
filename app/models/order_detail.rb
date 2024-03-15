class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { 
          making_unable: 0, 
          waiting_for_making: 1, 
          in_making: 2, 
          making_completed: 3 
        }
        
  def with_tax_price
    ( item.price * 1.1).floor
  end
  
  def subtotal
    item.with_tax_price * amount
  end
  
end

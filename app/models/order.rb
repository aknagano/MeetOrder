class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  validates :post_code,presence:true
  validates :name,presence:true
  validates :address,presence:true
  validates :delivery_date,presence:true
  validates :payment_method,presence:true
  
  enum payment_method: {credit_card: 0, transfer: 1}

  enum order_status: {wait_payment: 0, 
                      confirm_payment: 1, 
                      making: 2, 
                      preparing_ship: 3, 
                      finish_prepare: 4
                      }
  
  # enum payment_method: {クレジットカード: 0, 銀行振込: 1}
  
  # enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
end

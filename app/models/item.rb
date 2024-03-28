class Item < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :order_details
  
  belongs_to :production_area
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion:{in: [true, false]}
  validates :production_area_id, presence: true
  
  has_one_attached :image
  # enum is_active: { on_sale: 0, off_sale: 1 }
  
  def with_tax_price
    (price * 1.1).floor
  end
end

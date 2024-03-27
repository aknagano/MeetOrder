class Address < ApplicationRecord
  belongs_to :customer
  
  with_options presence: true do
    validates :post_code
    validates :address
    validates :name
  end
end

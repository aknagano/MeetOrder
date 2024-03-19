class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :messages, dependent: :destroy


  with_options presence: true do
    validates :enterprise_name, presence: true
    validates :enterprise_name_kana, presence: true
    validates :post_code, presence: true
    validates :telephone_number, presence: true
    validates :email, presence: true
  end
end

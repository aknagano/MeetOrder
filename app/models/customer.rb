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
    validates :enterprise_name
    validates :enterprise_name_kana
    validates :post_code
    validates :address
    validates :telephone_number
    validates :email
  end
  
  # 定数にメールアドレスを格納
  GUEST_CUSTOMER_EMAIL = "guest@example.com"

  def self.guest
    # find_or_create_byでメールアドレスが存在するかどうか判断。存在しない場合はデータを作成する。
    find_or_create_by(email: GUEST_CUSTOMER_EMAIL) do |customer|
      # SecureRandom.urlsafe_base64:ランダムな文字列を生成するRubyのメソッド
      customer.password = SecureRandom.urlsafe_base64
      customer.enterprise_name = "guest customer"
      customer.enterprise_name_kana = "ゲスト カスタマー"
      customer.post_code = "0010000"
      customer.address = "北海道札幌市北区"
      customer.telephone_number = "00000000000"
    end
  end
  
  # ref: https://qiita.com/Naggi-Goishi/items/49f758608f93286a3701
  def active_for_authentication?
    super && is_customer_status?
  end
  
  def inactive_message
    is_customer_status? ? super : :status_false
  end
end

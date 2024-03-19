class Room < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :entry_id, uniqueness: true
end

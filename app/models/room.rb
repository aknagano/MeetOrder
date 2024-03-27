class Room < ApplicationRecord
  belongs_to :entry
  has_many :messages, dependent: :destroy

  validates :entry_id, uniqueness: true
end

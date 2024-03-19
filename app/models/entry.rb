class Entry < ApplicationRecord
  has_one :room, dependent: :destroy
end

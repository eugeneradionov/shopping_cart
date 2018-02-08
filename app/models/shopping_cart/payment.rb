module ShoppingCart
  class Payment < ApplicationRecord
    has_many :orders

    validates :card_number, :mm_yy, :cvv, presence: true
    validates :name_on_card, length: { maximum: 50 }
    validates :cvv, length: { in: 3..4 }
  end
end

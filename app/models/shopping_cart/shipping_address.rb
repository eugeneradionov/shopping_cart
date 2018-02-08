module ShoppingCart
  class ShippingAddress < ApplicationRecord
    has_many :orders
    validates :first_name, length: { maximum: 50 }
    validates :last_name, length: { maximum: 50 }
    validates :address, length: { maximum: 50 }
    validates :country, length: { maximum: 50 }
    validates :city, length: { maximum: 50 }
    validates :zip, length: { maximum: 10 }
  end
end

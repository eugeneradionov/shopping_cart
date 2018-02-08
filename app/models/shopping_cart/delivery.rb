module ShoppingCart
  class Delivery < ApplicationRecord
    has_many :orders
    validates :method, :days_from, :days_to, :price, presence: true
  end
end

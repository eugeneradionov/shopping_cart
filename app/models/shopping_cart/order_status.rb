module ShoppingCart
  class OrderStatus < ApplicationRecord
    has_many :orders

    validates_presence_of :status

    def in_progress?
      status == 'In Progress'
    end
  end
end

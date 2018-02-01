module ShoppingCart
  class OrderItem < ApplicationRecord
    belongs_to :product, class_name: ShoppingCart.product_class.to_s
    belongs_to :cart
    belongs_to :order, optional: true

    validates_presence_of :quantity

    def subtotal_price
      product.price * quantity
    end
  end
end

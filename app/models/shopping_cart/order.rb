module ShoppingCart
  class Order < ApplicationRecord
    belongs_to :delivery, optional: true
    belongs_to :shipping_address, optional: true
    belongs_to :billing_address, optional: true
    belongs_to :payment, optional: true
    belongs_to :order_status
    belongs_to :user, class_name: ShoppingCart.user_class.to_s
    has_many :order_items

    scope :in_delivery, -> { where(order_status: OrderStatus.find_by(status: 'In Delivery')) }
    scope :delivered, -> { where(order_status: OrderStatus.find_by(status: 'Delivered')) }
    scope :waiting_for_processing, -> { where(order_status: OrderStatus.find_by(status: 'Waiting for Processing')) }
    scope :in_progress, -> { where(order_status: OrderStatus.find_by(status: 'In Progress')) }
    scope :canceled, -> { where(order_status: OrderStatus.find_by(status: 'Canceled')) }

    def order_total
      discount_amount = discount || 0
      order_items.to_a.sum(&:subtotal_price) - discount_amount
    end

    def order_total_with_delivery
      delivery_price = delivery.price
      order_total + delivery_price
    end

    def order_items_total
      order_items.to_a.sum(&:subtotal_price)
    end

    def status
      order_status.status
    end

    def in_progress?
      order_status.in_progress?
    end
  end
end

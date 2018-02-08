class CreateShoppingCartOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_orders do |t|
      t.decimal :discount
      t.string :aasm_state
      t.string :use_billing_address
      t.integer :user_id, foreign_key: true
      t.references :cart,
                   foreign_key: { to_table: :shopping_cart_carts }
      t.references :delivery,
                   foreign_key: { to_table: :shopping_cart_deliveries }
      t.references :shipping_address,
                   foreign_key: { to_table: :shopping_cart_shipping_addresses }
      t.references :billing_address,
                   foreign_key: { to_table: :shopping_cart_billing_addresses }
      t.references :payment,
                   foreign_key: { to_table: :shopping_cart_payments }
      t.references :order_status,
                   foreign_key: { to_table: :shopping_cart_order_statuses }

      t.timestamps
    end
  end
end

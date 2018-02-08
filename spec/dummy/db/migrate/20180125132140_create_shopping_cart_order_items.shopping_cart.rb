# This migration comes from shopping_cart (originally 20180125114804)
class CreateShoppingCartOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_order_items do |t|
      t.integer :quantity, default: 1
      t.references :order,
                   foreign_key: { to_table: :shopping_cart_orders },
                   optional: true
      t.references :cart,
                   foreign_key: { to_table: :shopping_cart_carts },
                   optional: true
      t.integer :product_id, foreign_key: true

      t.timestamps
    end
  end
end

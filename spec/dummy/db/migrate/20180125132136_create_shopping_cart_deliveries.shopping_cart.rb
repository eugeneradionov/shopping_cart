# This migration comes from shopping_cart (originally 20180125114135)
class CreateShoppingCartDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_deliveries do |t|
      t.string :method
      t.integer :days_from
      t.integer :days_to
      t.decimal :price

      t.timestamps
    end
  end
end

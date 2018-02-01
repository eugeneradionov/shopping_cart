class CreateShoppingCartCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_carts do |t|
      t.integer :user_id
      t.decimal :discount

      t.timestamps
    end
  end
end
